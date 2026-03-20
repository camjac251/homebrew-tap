class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "28c67e220f3f28cfa8d35d0e4bfa6aec1b0ade6fb99ba644b3aeb7ae2bbe048b"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "f5fc0cc61b3a032448cd778e5e781ac4100a9a0bfa0fadb327e4168d5a9fa106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "cb4f1a5e2c36e2cb020eb37b133130b42dbd44727de0c271a93138dbfac8dc0a"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "70e63db94eb3af484cd5e1e02cafbc5c0fb4483ef74580d42dae5786bfe6dddb"
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
