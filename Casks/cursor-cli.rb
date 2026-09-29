cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.09.28-64d2043"
  sha256 arm64_linux:  "c737599b27d3d8d6743c72b487204e335f3a8ea2fdbaf18302ee207a646ffd8d",
         x86_64_linux: "6e4cd936a4866b8a77c50ff51a564460d715772fabc477a01aa0f0455d9559f0"

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
