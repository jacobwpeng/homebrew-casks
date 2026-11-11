cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.11-043ef28"
  sha256 arm64_linux:  "e8199ea0b184c5985f1c7ecd8b1a43ea85d4e51367b12d0be70ec3d9dd354345",
         x86_64_linux: "5d82bd6e6f090b1804b8284fdc68050f0d588183cafc9d78365379e218ed650c"

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
