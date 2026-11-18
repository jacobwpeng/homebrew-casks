cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.11.17-f532c45"
  sha256 arm64_linux:  "dff929e5e5ace2ced880290095df5938545267d73fd1d84be669be75dbdc1558",
         x86_64_linux: "189ed41d8963cd22dcdafbbd62f072cc55ac08374c922dbd04aee525f4018ab6"

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
