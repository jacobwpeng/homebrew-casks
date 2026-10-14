cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.12-d47ca18"
  sha256 arm64_linux:  "2cbb98b79e821b3b08e76a2eb4de4c9333544af3bc81aba8c8d581256af71e7a",
         x86_64_linux: "ba41befe41e7d99ecec22eb0aa01720c9cd475d66035f4d90d2acfd74bcd8fdb"

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
