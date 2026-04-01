class WslClipBridge < Formula
  desc "WSL clipboard bridge - drop-in xclip replacement using Windows clipboard"
  homepage "https://github.com/camjac251/wsl-clip-bridge"
  version "1.1.1"
  license "MIT"

  depends_on :linux

  on_arm do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-arm64"
    sha256 "71a9aae39a7ba38403f77aa0848ff5efe235e8513dc4f8b965cae44eb6268104"
  end
  on_intel do
    url "https://github.com/camjac251/wsl-clip-bridge/releases/download/v#{version}/xclip-linux-x86_64"
    sha256 "b03485987f7f402f099fbdafcbf3ff03221e7b4de0cf573043faf1c24918bdf3"
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
