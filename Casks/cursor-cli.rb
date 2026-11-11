cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.10-731fb78"
  sha256 arm64_linux:  "5f211675d0e64e6a2f23e7c9bcb518a15855b924837145b5d2b414dc1c6dbf84",
         x86_64_linux: "f39e124227aa179ae16ac0785e293cbe29218b2d1c167ba7adf68bfc8c3812a9"

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
