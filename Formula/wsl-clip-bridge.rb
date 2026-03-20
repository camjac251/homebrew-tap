class WslClipBridge < Formula
  desc "WSL clipboard bridge - drop-in xclip replacement using Windows clipboard"
  homepage "https://github.com/camjac251/wsl-clip-bridge"
  version "1.1.0"
  license "MIT"

  depends_on :linux

  on_arm do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-arm64"
    sha256 "003638612acd4381d209c68c4e8a406f68139afc4743f119a277f8599c8fe63a"
  end
  on_intel do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-x86_64"
    sha256 "083bb9a419ced09d83501696681a0e62018d77b8aa48a8b7ae8bc984e0b2e856"
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
