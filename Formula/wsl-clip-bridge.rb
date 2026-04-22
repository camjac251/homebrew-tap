class WslClipBridge < Formula
  desc "WSL clipboard bridge - drop-in xclip replacement using Windows clipboard"
  homepage "https://github.com/camjac251/wsl-clip-bridge"
  version "1.1.2"
  license "MIT"

  depends_on :linux

  on_arm do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-arm64"
    sha256 "5baac5b0992b07e5a91e64cf8aecda7a29267252ff6981e292600a718ffed222"
  end
  on_intel do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-x86_64"
    sha256 "80ddf0fb36e482c5f5de22739421181df675888d8cb1c0b547fbdae9a8b4de13"
  end

  conflicts_with "xclip", because: "both install an `xclip` binary"

  def install
    binary = Dir["xclip-*"].first
    bin.install binary => "xclip"
  end

  test do
    assert_match "wsl-clip-bridge", shell_output("#{bin}/xclip --help 2>&1", 2)
  end
end
