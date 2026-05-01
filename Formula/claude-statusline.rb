class ClaudeStatusline < Formula
  desc "Rust-powered status line for Claude Code terminal sessions"
  homepage "https://github.com/camjac251/rust-statusline"
  version "1.4.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-arm64"
      sha256 "8bb08e570e3fba092b9fb1d3a0877a0c85a3f4fb201eb8d8d764ad01ccebb245"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-x86_64"
      sha256 "d5c5b20bde4112d504731c433002e21ec71b7550c815fee282fe7c35868d062e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-arm64"
      sha256 "add0a9c9874f2c7e8d122e998154d6f3b632bb88d6c1b0c844d51e2f61d7b819"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-x86_64"
      sha256 "ce40a1cd2f346c0d8bd66c4c8b6a32cc29e2da9c5a6f07fb0b54d21e763d162e"
    end
  end

  def install
    binary = Dir["claude_statusline-*"].first
    bin.install binary => "claude_statusline"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude_statusline --version")
  end
end
