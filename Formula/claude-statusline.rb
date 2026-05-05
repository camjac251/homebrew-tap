class ClaudeStatusline < Formula
  desc "Rust-powered status line for Claude Code terminal sessions"
  homepage "https://github.com/camjac251/rust-statusline"
  version "1.5.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-arm64"
      sha256 "8e2395fec2de283209d241be391fdd55365bc93b651027e2e97f3354f5f3417e"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-macos-x86_64"
      sha256 "9a6fad6c49a8415ac748f48ee8970a71b9ff3cda86af1a5b6ee6bea7e8b1eb89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-arm64"
      sha256 "1747b30a1e66f4e48e0a4a4de6f86c3521fb31c7af4c087b73e94429bfbbb994"
    end
    on_intel do
      url "https://github.com/camjac251/rust-statusline/releases/download/v#{version}/claude_statusline-linux-x86_64"
      sha256 "0b312a18b6405a817086579342c182d484f9b73c186f235a070f5ae1d6c3d1a5"
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
