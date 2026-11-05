cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.05-86047df"
  sha256 arm64_linux:  "131554bfdbf683d8ebfef83a2bb46ac4e5d060f198711040b07ed063c2471871",
         x86_64_linux: "170b77786cbf4c93064d64fff12b71a178b968730561c64afc2e8e752535442e"

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
