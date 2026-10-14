cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.10.14-0f9edde"
  sha256 arm64_linux:  "28028e8adb8266c8b7c00d11950765fbf9a3b9cac77a98b7c92b172646b35f4b",
         x86_64_linux: "74fac931fe3578980d070701872b7dab54eb87a9abf9b6e2e6be19beeb9167a7"

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
