#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: bash pushsong.sh song_name"
  exit 1
fi
F=$(find ~/storage/downloads/ -iname "*$1*" 2>/dev/null | head -n 1)
if [ -z "$F" ]; then
  echo "Not found: $1"
  exit 1
fi
echo "Found: $F"
cp "$F" ~/my-website/love_story.mp3 && \
cd ~/my-website && \
git add . && \
git commit -m "Update music: $1" && \
git push
