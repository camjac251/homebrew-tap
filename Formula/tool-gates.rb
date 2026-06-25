class ToolGates < Formula
  desc "Intelligent tool permission gates for AI coding assistants"
  homepage "https://github.com/camjac251/tool-gates"
  version "1.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-arm64"
      sha256 "11f245e1fb975ffc78f7680c8abd14098ea2349e70d742c91c4ff86196858cce"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-macos-x86_64"
      sha256 "094e241c5b333b34f816c14d780a12ea80aafd30f0a46f73a1ded9511b15725c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-arm64"
      sha256 "185fe9b96bd894baacfe3f69210c2941c94e8ff8d7135c78eb65546025fa7516"
    end
    on_intel do
      url "https://github.com/camjac251/tool-gates/releases/download/v#{version}/tool-gates-linux-x86_64"
      sha256 "18b774ac6c9f0aa09630e497848765e7d5432feb69d342943750717ce5d591a9"
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
