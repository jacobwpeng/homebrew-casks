cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.09.26-dd393fe"
  sha256 arm64_linux:  "ab1178d0d8c10b254e7e427d1d673533a389338424e75034be9ab9da02845bde",
         x86_64_linux: "8085fd120f5c71f4eae7fea26a043718e5644e3071e4fab3220a0e58c51f9593"

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
