import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

from web.app import app  # noqa: E402


if __name__ == '__main__':
    app.run()
