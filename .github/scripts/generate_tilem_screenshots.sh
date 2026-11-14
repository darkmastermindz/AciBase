#!/usr/bin/env bash
set -euo pipefail

mkdir -p .tmp doc "$HOME/.config/tilem2/screenshots"
printf '%s' "${TI83P_ROM_BASE64}" | base64 --decode > .tmp/ti83p.rom

IFS=',' read -r -a names <<< "${SHOT_NAMES}"
IFS=',' read -r -a delays <<< "${CAPTURE_DELAYS}"
if [ "${#names[@]}" -ne 4 ] || [ "${#delays[@]}" -ne 4 ]; then
  echo "Expected exactly 4 screenshot names and 4 capture delays."
  exit 1
fi

tilem_cmd=(tilem2 -r .tmp/ti83p.rom --without-skin --reset)
if [ -n "${MACRO_FILE}" ]; then
  if [ ! -f "${MACRO_FILE}" ]; then
    echo "Macro file not found: ${MACRO_FILE}"
    exit 1
  fi
  tilem_cmd+=(--play-macro "${MACRO_FILE}")
fi
tilem_cmd+=(AciBase.8xp)

"${tilem_cmd[@]}" >/tmp/tilem2.log 2>&1 &
tilem_pid=$!

cleanup() {
  if kill -0 "$tilem_pid" >/dev/null 2>&1; then
    kill "$tilem_pid" || true
    wait "$tilem_pid" || true
  fi
}
trap cleanup EXIT

window_id=""
for _ in $(seq 1 30); do
  window_id="$(xdotool search --onlyvisible --name "TilEm" 2>/dev/null | head -n1 || true)"
  if [ -n "$window_id" ]; then
    break
  fi
  sleep 1
done

if [ -z "$window_id" ]; then
  echo "TilEm window not found."
  tail -n 200 /tmp/tilem2.log || true
  exit 1
fi

xdotool windowactivate "$window_id"
shot_dir="$HOME/.config/tilem2/screenshots"
prev_delay=0

for idx in 0 1 2 3; do
  delay="${delays[$idx]}"
  sleep_for=$((delay - prev_delay))
  if [ "$sleep_for" -lt 0 ]; then
    echo "Capture delays must be in ascending order."
    exit 1
  fi

  sleep "$sleep_for"
  prev_delay="$delay"

  before="$(find "$shot_dir" -maxdepth 1 -type f | wc -l)"
  xdotool key --window "$window_id" ctrl+shift+Print

  newest=""
  for _ in $(seq 1 10); do
    after="$(find "$shot_dir" -maxdepth 1 -type f | wc -l)"
    if [ "$after" -gt "$before" ]; then
      newest="$(ls -1t "$shot_dir"/* 2>/dev/null | head -n1 || true)"
      break
    fi
    sleep 1
  done

  if [ -z "$newest" ] || [ ! -f "$newest" ]; then
    echo "Screenshot capture failed for index $idx."
    exit 1
  fi

  convert "$newest" -resize 192x128\! "doc/${names[$idx]}.BMP"
done

convert -delay 120 -loop 0 \
  "doc/${names[0]}.BMP" \
  "doc/${names[1]}.BMP" \
  "doc/${names[2]}.BMP" \
  "doc/${names[3]}.BMP" \
  "doc/DEMO.gif"

perl -0pi -e 's|!\[Demo\]\([^)]+\)|![Demo](doc/DEMO.gif)|' README.md
