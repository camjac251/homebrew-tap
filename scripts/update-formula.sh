#!/bin/bash
# Update a Homebrew formula's version and SHA256 checksums.
# Usage: ./scripts/update-formula.sh <formula-file> <version> <sha1> [sha2] [sha3] [sha4]
# SHA values are replaced in order of appearance in the formula.
set -euo pipefail

FORMULA=$1
VERSION=$2
shift 2

if [ ! -f "$FORMULA" ]; then
	echo "Formula not found: $FORMULA" >&2
	exit 1
fi

# Update version
sed -i "s/version \"[^\"]*\"/version \"$VERSION\"/" "$FORMULA"

# Replace sha256 values in order using awk
# Pass SHAs as a single delimited string to avoid eval
IFS='|' SHAS="$*"
awk -v shas="$SHAS" '
  BEGIN { split(shas, s, "|"); n=0 }
  /sha256/ {
    n++
    if (n in s) sub(/sha256 "[^"]*"/, "sha256 \"" s[n] "\"")
  }
  { print }
' "$FORMULA" >"${FORMULA}.tmp" && mv "${FORMULA}.tmp" "$FORMULA"

echo "Updated $FORMULA to version $VERSION"
