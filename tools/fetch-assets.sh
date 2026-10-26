#!/usr/bin/env bash
# Downloads every image listed in tools/assets.txt and stores it in this repo,
# so the site no longer depends on other websites. Format per line:  URL|output-path-without-extension
set -u
while IFS='|' read -r url out; do
  [ -z "$url" ] && continue
  if ls "$out" "$out".* >/dev/null 2>&1; then echo "SKIP (already stored): $out"; continue; fi
  mkdir -p "$(dirname "$out")"
  tmp=$(mktemp)
  if ! curl -fsSL -A "Mozilla/5.0" --connect-timeout 20 --max-time 60 --retry 1 -o "$tmp" "$url"; then echo "FAILED: $url"; rm -f "$tmp"; continue; fi
  case "$out" in
    *.svg) mv "$tmp" "$out" ;;
    logos/*) convert "$tmp" -background none -resize '600x600>' "$out.png" && rm -f "$tmp" || mv "$tmp" "$out.png" ;;
    images/solutions/*) convert "$tmp" -resize '720x720>' -quality 80 "$out.webp" && rm -f "$tmp" || mv "$tmp" "$out.webp" ;;
    *) convert "$tmp" -background white -flatten -resize '480x480>' -quality 78 "$out.webp" && rm -f "$tmp" || mv "$tmp" "$out.webp" ;;
  esac
  echo "OK: $out"
done < tools/assets.txt
