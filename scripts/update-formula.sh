#!/bin/bash
# Update a Homebrew formula's version and SHA256 checksums.
# Usage: ./scripts/update-formula.sh <formula-file> <version> <sha-macos-arm64> <sha-macos-x86_64> <sha-linux-arm64> <sha-linux-x86_64>
set -euo pipefail

FORMULA=$1
VERSION=$2
SHA_MACOS_ARM64=$3
SHA_MACOS_X86_64=$4
SHA_LINUX_ARM64=$5
SHA_LINUX_X86_64=$6

if [ ! -f "$FORMULA" ]; then
  echo "Formula not found: $FORMULA" >&2
  exit 1
fi

# Update version
sed -i "s/version \"[^\"]*\"/version \"$VERSION\"/" "$FORMULA"

# Update sha256 values in order: macos-arm64, macos-x86_64, linux-arm64, linux-x86_64
awk -v s1="$SHA_MACOS_ARM64" -v s2="$SHA_MACOS_X86_64" -v s3="$SHA_LINUX_ARM64" -v s4="$SHA_LINUX_X86_64" '
  BEGIN { n=0 }
  /sha256/ {
    n++
    if (n==1) sub(/sha256 "[^"]*"/, "sha256 \"" s1 "\"")
    if (n==2) sub(/sha256 "[^"]*"/, "sha256 \"" s2 "\"")
    if (n==3) sub(/sha256 "[^"]*"/, "sha256 \"" s3 "\"")
    if (n==4) sub(/sha256 "[^"]*"/, "sha256 \"" s4 "\"")
  }
  { print }
' "$FORMULA" > "${FORMULA}.tmp" && mv "${FORMULA}.tmp" "$FORMULA"

echo "Updated $FORMULA to version $VERSION"
