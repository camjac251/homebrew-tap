class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "7ace30f461e8577ab5d38d4d3c8728c3c41088d3e754b37ae33dd1e107d6f63d"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "14adbf1fad4a6eab2df249f41d7352274893f7bcb476b701536b6e72ed29a995"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "49c612537ba1755fb1dc7ebcff67590380904aa7921b76ace59a679018ea6dad"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "c265dfcbafe53a384e2c11128f2fc94195156ff044e95e1f109aeb0b2a7c2bca"
    end
  end

  def install
    binary = Dir["tool-gates-*"].first
    bin.install binary => "tool-gates"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tool-gates --version")
  end
end
