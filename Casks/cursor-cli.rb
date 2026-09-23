cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.09.18-9a7762b"
  sha256 arm64_linux:  "210d58f850f4616e4f265ff7006c558d5a2a008fce3e2bf8a0105c25ae3456a0",
         x86_64_linux: "b1308f5a2fc05458b9d8966752986bb23a971bbcc67c842c1df94c4b8132bad9"

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
