cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.18-ea085cb"
  sha256 arm64_linux:  "11bfd83aa338d4e8ad9f06f11c65db012106daf04f736bc683765760b93eb3dc",
         x86_64_linux: "22325b799e8b7a8a94fc79d3596cbfa1b85407343d34c3a552f703d4023b1c79"

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
