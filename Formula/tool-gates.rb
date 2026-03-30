class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "6d8c6375bc4bb3a6afc12fed17f0fc9159dd6ac934d31da255d671ca9edc6983"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "7804f5c7d9a10890996c56df60983fd0209cde7f6f9625b99becdf6aa790369d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "2545b20cc8d083c0049277291b8d8f62940e6e09df0a1070749948e967f8f9f0"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "1ad9966fc9ab6ca031117330e7e55144024e4f8e3a3cdcb4b1e6853b64f67544"
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
