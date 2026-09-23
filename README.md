# jacobwpeng/cursor-cli

Linux Homebrew cask for [Cursor CLI](https://cursor.com/). It installs and upgrades `cursor-agent`, following the macOS [`cursor-cli`](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/c/cursor-cli.rb) cask.

The official Homebrew cask is macOS-only. This tap downloads the Linux `agent-cli-package` for x86_64 and arm64.

## Install

```bash
brew install --cask jacobwpeng/cursor-cli/cursor-cli
```

## Upgrade

```bash
brew upgrade --cask jacobwpeng/cursor-cli/cursor-cli
```

Or tap it first:

```bash
brew tap jacobwpeng/cursor-cli
brew install --cask cursor-cli
brew upgrade --cask cursor-cli
```
