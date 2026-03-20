class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "3c60ea74be569014b87196271d5a26eb97acd7c1654f402787bf6224c40eb71b"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "289b9ba1792b625688ee1ff8787cc6897eaac5faafb17801f32d0406dc2bfe8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "8c2890a332917f78c73132687b93cf7147dd76bb953cb9208dd2c8fb6b6edde3"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "829c178c10697c10a2b1dee4221094f8ab71e6e48737c63641342ceb18739a9e"
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
