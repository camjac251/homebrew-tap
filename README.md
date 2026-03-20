# Homebrew Tap

Homebrew formulae for personal Rust projects. Formulas are updated automatically by [brew-bottler](https://github.com/apps/brew-bottler) when new releases are published.

## Install

```bash
# First-time install (auto-taps)
brew install camjac251/tap/tool-gates
brew install camjac251/tap/claude-statusline

# After tapping, upgrades work normally
brew upgrade tool-gates
brew upgrade claude-statusline
```

## Formulas

| Formula | Description | Platforms |
|---|---|---|
| [tool-gates](https://github.com/camjac251/tool-gates) | Intelligent tool permission gates for AI coding assistants | macOS, Linux (arm64, x86_64) |
| [claude-statusline](https://github.com/camjac251/rust-statusline) | Status line for Claude Code terminal sessions | macOS, Linux (arm64, x86_64) |

## How it works

Each project's release workflow:
1. Builds binaries for all platforms via GitHub Actions
2. Attests build provenance (sigstore)
3. Uploads binaries to the GitHub Release
4. Generates a scoped token via the brew-bottler GitHub App
5. Computes SHA256 checksums and updates the formula in this repo
