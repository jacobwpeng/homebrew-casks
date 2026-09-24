cask "cursor-cli" do
  arch arm: "arm64", intel: "x64"

  version "2026.09.23-86fc751"
  sha256 arm64_linux:  "38d1482c945172926e780206fce8cc51c67dd4f96162bcec680903aa70d80417",
         x86_64_linux: "740dd9d6eb5aec36ca90eaedf9fd5e2c489cd674d69b5147b3c2670f02d9776d"

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
