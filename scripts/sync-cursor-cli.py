#!/usr/bin/env python3
"""Update the Linux cursor-cli cask to the macOS Homebrew cask version."""

import hashlib
import os
import re
import sys
import urllib.error
import urllib.request

CASK_PATH = "Casks/cursor-cli.rb"
MACOS_CASK_URL = (
    "https://raw.githubusercontent.com/Homebrew/homebrew-cask/master/Casks/c/cursor-cli.rb"
)
DOWNLOAD_URL = "https://downloads.cursor.com/lab/{version}/linux/{arch}/agent-cli-package.tar.gz"
USER_AGENT = "jacobwpeng-homebrew-casks"
VERSION_RE = re.compile(r'^  version "([^"]+)"\s*$', re.MULTILINE)


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        return urllib.request.urlopen(request, timeout=120)
    except urllib.error.HTTPError as error:
        raise SystemExit(f"download failed ({error.code}): {url}") from error
    except urllib.error.URLError as error:
        raise SystemExit(f"download failed: {url}: {error.reason}") from error


def read_text(url):
    with fetch(url) as response:
        return response.read().decode()


def sha256(url):
    digest = hashlib.sha256()
    with fetch(url) as response:
        while True:
            chunk = response.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def set_output(name, value):
    print(f"{name}={value}")
    output = os.environ.get("GITHUB_OUTPUT")
    if output:
        with open(output, "a", encoding="utf-8") as handle:
            handle.write(f"{name}={value}\n")


def main():
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    macos_cask = read_text(MACOS_CASK_URL)
    match = VERSION_RE.search(macos_cask)
    if not match:
        raise SystemExit("macOS cursor-cli cask has no version stanza")
    version = match.group(1)

    with open(CASK_PATH, encoding="utf-8") as handle:
        cask = handle.read()
    current = VERSION_RE.search(cask)
    if not current:
        raise SystemExit(f"{CASK_PATH} has no version stanza")
    if current.group(1) == version:
        print(f"cursor-cli is already {version}")
        set_output("updated", "false")
        set_output("version", version)
        return

    print(f"updating {current.group(1)} -> {version}")
    arm64 = sha256(DOWNLOAD_URL.format(version=version, arch="arm64"))
    x64 = sha256(DOWNLOAD_URL.format(version=version, arch="x64"))
    updated = VERSION_RE.sub(f'  version "{version}"', cask, count=1)
    updated = re.sub(
        r'^  sha256 arm64_linux:\s+"[0-9a-f]+",\n         x86_64_linux:\s+"[0-9a-f]+"',
        f'  sha256 arm64_linux:  "{arm64}",\n         x86_64_linux: "{x64}"',
        updated,
        count=1,
        flags=re.MULTILINE,
    )
    if updated == cask or f'version "{version}"' not in updated:
        raise SystemExit("failed to rewrite the cask")
    if arm64 not in updated or x64 not in updated:
        raise SystemExit("failed to rewrite checksums")

    with open(CASK_PATH, "w", encoding="utf-8") as handle:
        handle.write(updated)
    print(f"updated {CASK_PATH} to {version}")
    set_output("updated", "true")
    set_output("version", version)


if __name__ == "__main__":
    sys.exit(main() or 0)
