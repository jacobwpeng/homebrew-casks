cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.16-e3cb207"
  sha256 arm64_linux:  "4cf077f150eb8d1e270bf1dea69700184c39a4847fe192d523f5bb34d4b62597",
         x86_64_linux: "3aa3f48cd7a3909a98c9b3f2a4085f0c021088bf826690b22c61f424c843e552"

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
