class ClaudeStatusline < Formula
  desc "Rust-powered status line for Claude Code terminal sessions"
  homepage "https://github.com/camjac251/rust-statusline"
  version "2.11.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-arm64"
      sha256 "89dbff93ff1c049826ebaa1c53167864027654e9b7b28780a5d147a1a87209b7"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-x86_64"
      sha256 "01431a5d00b3b5d3243e9c99c73224654ced2559f9e2a7b11bb97dafe9e84c6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-arm64"
      sha256 "9aff2b91736700d4282e12f01f2d9cfab5c770e5c213d40011af04f10509e7ed"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-x86_64"
      sha256 "c3c35a60cc54b7c13c3a1444dab8f40c87f8b278749b7d3c2e21c7ef75fe62c1"
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
