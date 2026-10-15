cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.14-941492e"
  sha256 arm64_linux:  "cbba40d90d7f699874e133a5c15bf3854cee006565bd3bb00a6c79b49d62b0d0",
         x86_64_linux: "6f6bf39dd2df29dcd38643cdfab0155ce71699953889f732deec123f6562bb2d"

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
