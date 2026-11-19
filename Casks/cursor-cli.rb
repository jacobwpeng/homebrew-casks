cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.19-f005e9d"
  sha256 arm64_linux:  "5ff05be0d7c0b7754574dbcd677c35254a3ff190ed6457e71bbee0f276237e29",
         x86_64_linux: "a25986eaf0c9330aeeec599a139711cb9f267c64562d073a72b751edf5161695"

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
