import os
import subprocess
import sys


def test_hello_output():
    test_dir = os.path.dirname(os.path.abspath(__file__))
    result = subprocess.run(
        [sys.executable, os.path.join(test_dir, "hello.py")],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0
    assert "Hello from hooks experiment" in result.stdout
