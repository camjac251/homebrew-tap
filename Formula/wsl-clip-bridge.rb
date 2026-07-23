class WslClipBridge < Formula
  desc "WSL clipboard bridge - drop-in xclip replacement using Windows clipboard"
  homepage "https://github.com/camjac251/wsl-clip-bridge"
  version "1.1.3"
  license "MIT"

  depends_on :linux

  on_arm do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-arm64"
    sha256 "43b5e651053b036215545b212bc137b8891914ff72a4ae1db9dcc547a51af614"
  end
  on_intel do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-x86_64"
    sha256 "d6734d8dea2159b4be15751597fef42999920b1768e684f8c92af49e67008e1a"
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
