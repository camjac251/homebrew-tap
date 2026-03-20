class WslClipBridge < Formula
  desc "WSL clipboard bridge - drop-in xclip replacement using Windows clipboard"
  homepage "https://github.com/camjac251/wsl-clip-bridge"
  version "1.0.1"
  license "MIT"

  depends_on :linux

  on_arm do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-arm64"
    sha256 "efec95e8c4301c5d4b08bcc615ddb105fe745f473a3f5de4a1aa63859829ece4"
  end
  on_intel do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-x86_64"
    sha256 "bef9179217e2f0317f47210719326991654f6554f34821bda48185edd278e76f"
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
