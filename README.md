# jacobwpeng/homebrew-casks

Linux casks. `cursor-cli` installs `cursor-agent` from the same version as the macOS [cursor-cli cask](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/c/cursor-cli.rb).

## Install

```bash
brew install --cask jacobwpeng/homebrew-casks/cursor-cli
```

## Upgrade

```bash
brew upgrade --cask jacobwpeng/homebrew-casks/cursor-cli
```

A GitHub Action checks the macOS cask every 6 hours. When its version changes, the action downloads the Linux x64 and arm64 packages, updates the checksums, and pushes the cask.
