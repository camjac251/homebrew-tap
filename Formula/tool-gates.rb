class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.5.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "841b6ed1d20cb57811fd56bf39651ef9f328b3b0ed533d44a7f0434cf9e45ed5"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "88733128396492ecaf0e59b17a0f0119b11d3b3811a13eec497e86bbb08829d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "0f32e8bd575c5b25ced7b4a0b20eb8674f3013de9fcc06935b3d9721529ba806"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "15e15b34a2cec07216e5dafb0a26cc911283f78e4c1f3d35802747bad4b66320"
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
