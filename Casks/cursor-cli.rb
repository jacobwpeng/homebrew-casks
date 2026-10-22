cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.22-27dcf5f"
  sha256 arm64_linux:  "22a36df9720830668ccd4d707e5190204ab9c8a0efb2f068cc914895f804d3ec",
         x86_64_linux: "85296944e4600a83c4b764f578d1502bf9c416db200d33a593e8f3ecabfdc294"

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
