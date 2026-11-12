#!/usr/bin/env python3
"""Build an Inform 7 story and play commands through it from the command line.

Usage:
    tools/play.py Keithwood/story.ni "test me" "x patio" ...

Compiles the source with the Inform app's own compiler (a testing build, so
TEST ME works), runs the game in glulxe and prints the transcript as plain
text. Needs Inform.app in /Applications and glulxe from Homebrew
(`brew install glulxe`). Homebrew's glulxe is a full-screen terminal program,
so it is driven through a pseudo-terminal here and its screen codes stripped.

Options (before the source file):
    --wait SECONDS   how long to wait for output after each command (default 2;
                     raise it for long runs such as TEST ME)
    --seed N         random seed, so hazy details come out the same each run
                     (default 7; 0 for truly random)
"""
import fcntl, os, pty, re, select, shutil, struct, subprocess, sys, tempfile, termios, time

APP = "/Applications/Inform.app/Contents"
NI, I6 = APP + "/MacOS/ni", APP + "/MacOS/inform6"
INTERNAL = APP + "/Resources/Internal"
ROWS, COLS = 5000, 120  # tall, so the screen never scrolls (scrolling garbles the captured text)


def build(source, workdir):
    project = os.path.join(workdir, "game.inform")
    os.makedirs(os.path.join(project, "Source"))
    shutil.copy(source, os.path.join(project, "Source", "story.ni"))
    ni = subprocess.run([NI, "-internal", INTERNAL, "-project", project,
                         "-format=Inform6/32"], capture_output=True, text=True)
    if "Translation succeeded" not in ni.stdout + ni.stderr:
        problems = os.path.join(project, "Build", "Problems.html")
        text = open(problems, encoding="utf-8", errors="replace").read() \
            if os.path.exists(problems) else ni.stdout[-3000:]
        text = re.sub(r"<script.*?</script>|<style.*?</style>", "", text, flags=re.S)
        text = re.sub(r"<[^>]+>", " ", text)
        text = re.sub(r"&nbsp;", " ", text)
        text = re.sub(r"[ \t]+", " ", text)
        text = re.sub(r"\n\s*\n+", "\n", text)
        sys.exit(text.strip() + "\n\nInform 7 failed.")
    build_dir = os.path.join(project, "Build")
    i6 = subprocess.run([I6, "-wG", "+include_path=" + INTERNAL + "/Inter",
                         "auto.inf", "output.ulx"], cwd=build_dir,
                        capture_output=True, text=True)
    game = os.path.join(build_dir, "output.ulx")
    if not os.path.exists(game):
        sys.exit(i6.stdout[-3000:] + "\nInform 6 failed")
    return game


def play(game, commands, wait, seed):
    pid, fd = pty.fork()
    if pid == 0:
        fcntl.ioctl(0, termios.TIOCSWINSZ, struct.pack("HHHH", ROWS, COLS, 0, 0))
        os.environ["TERM"] = "vt100"
        os.execvp("glulxe", ["glulxe", "-width", str(COLS), "-height", str(ROWS),
                             "--rngseed", str(seed), game])
    out = b""

    def drain(seconds):
        nonlocal out
        end = time.time() + seconds
        while time.time() < end:
            ready, _, _ = select.select([fd], [], [], 0.1)
            if ready:
                try:
                    out += os.read(fd, 65536)
                except OSError:
                    return

    drain(2)
    for command in commands:
        os.write(fd, command.encode() + b"\r")
        drain(wait)
    os.kill(pid, 9)
    text = out.decode("utf-8", "replace")
    # glulxe moves down with ESC[nB rather than printing newlines.
    text = re.sub(r"\x1b\[(\d*)B", lambda m: "\n" * int(m.group(1) or 1), text)
    text = re.sub(r"\x1b\[\d*;?\d*[Hf]", "\n", text)
    text = re.sub(r"\x1b\[[0-9;?]*[A-Za-z]|\x1b[()][A-Z0-9]|\x1b[=>]|[\x0e\x0f]", "", text)
    text = re.sub(r"q{20,}", "\n", text)  # the status line's border
    text = re.sub(r"\n\s*\n(\s*\n)+", "\n\n", text.replace("\r", ""))
    return text


def main(args):
    wait, seed = 2.0, 7
    while args and args[0].startswith("--"):
        flag, value, args = args[0], args[1], args[2:]
        if flag == "--wait":
            wait = float(value)
        elif flag == "--seed":
            seed = int(value)
        else:
            sys.exit(__doc__)
    if not args:
        sys.exit(__doc__)
    with tempfile.TemporaryDirectory() as workdir:
        game = build(args[0], workdir)
        print(play(game, args[1:], wait, seed))


if __name__ == "__main__":
    main(sys.argv[1:])
