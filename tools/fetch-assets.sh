#!/usr/bin/env bash
# Downloads every image listed in tools/assets.txt and stores it in this repo,
# so the site no longer depends on other websites. Format per line:  URL|output-path-without-extension
set -u
while IFS='|' read -r url out; do
  [ -z "$url" ] && continue
  mkdir -p "$(dirname "$out")"
  tmp=$(mktemp)
  if ! curl -fsSL -A "Mozilla/5.0" --retry 2 -o "$tmp" "$url"; then echo "FAILED: $url"; rm -f "$tmp"; continue; fi
  case "$out" in
    *.svg) mv "$tmp" "$out" ;;
    logos/*) convert "$tmp" -background none -resize '600x600>' "$out.png" && rm -f "$tmp" || mv "$tmp" "$out.png" ;;
    *) convert "$tmp" -background white -flatten -resize '480x480>' -quality 78 "$out.webp" && rm -f "$tmp" || mv "$tmp" "$out.webp" ;;
  esac
  echo "OK: $out"
done < tools/assets.txt
