cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.13-eacade1"
  sha256 arm64_linux:  "e4ba0611045a24d1cf78f021d34c19461680fc7234c19c1f981f1cc169f70cdc",
         x86_64_linux: "c02e4321f20d691ee03af94d29948dc3a81c6c34e7328da7bb1afade4c75812f"

  url "https://downloads.cursor.com/lab/#{version}/linux/#{arch}/agent-cli-package.tar.gz"
  name "Cursor CLI"
  desc "Command-line agent for Cursor"
  homepage "https://cursor.com/"

  livecheck do
    url "https://cursor.com/install"
    regex(%r{downloads\.cursor\.com/lab/v?(\d+(?:[.-]\d+)+(?:[._-]\h+)?)/}i)
  end

  depends_on :linux

  binary "dist-package/cursor-agent", target: "cursor-agent"

  zap trash: [
    "~/.cache/cursor-compile-cache",
    "~/.config/cursor-agent",
    "~/.local/share/cursor-agent",
  ]
end
