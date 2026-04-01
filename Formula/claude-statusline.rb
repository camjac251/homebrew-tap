class ClaudeStatusline < Formula
  desc "Rust-powered status line for Claude Code terminal sessions"
  homepage "https://github.com/camjac251/rust-statusline"
  version "1.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-arm64"
      sha256 "3cd915ba32ec2fb215864507ce9b7ccb0cbcdd13891ec8a55442cd2bce10fd04"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-x86_64"
      sha256 "edc8a34e42742b9cf5b01bf30202a8a2a4bcd26a81dc649413fa901e2634904e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-arm64"
      sha256 "f5bfba74c0f8d5da3951f400a1a97f2b08ce45b1aadb9119fba1a220d6c4d898"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-x86_64"
      sha256 "83f4d652f12b2e37721bd7055c6526e29f08e98fcef2eef884cfdef71973d81e"
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
