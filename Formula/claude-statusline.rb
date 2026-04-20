class ClaudeStatusline < Formula
  desc "Rust-powered status line for Claude Code terminal sessions"
  homepage "https://github.com/camjac251/rust-statusline"
  version "1.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-arm64"
      sha256 "7fbee909b7490f5e8d6ef7904dad34cb5e15070b1312840b250527518cc32f95"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-x86_64"
      sha256 "0755a16553e1ee8f0e9c2c79a1d496b8c6073c1d83df1e2f8ee02e912111b5f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-arm64"
      sha256 "b11284f3ef99cfe554f2e9278d29ad245dcc38f4b2edba91942fdc0aadcc070d"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-x86_64"
      sha256 "20b8ec308c589f7f0fbb66247d0a8d206548f1c58a3b4c263268dbbe4b641a56"
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
