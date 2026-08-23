#!/bin/bash

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

PREVIEW_PORT=8765
PREVIEW_URL="http://localhost:${PREVIEW_PORT}/signature.html"

start_preview() {
  if pgrep -f "python3 -m http.server ${PREVIEW_PORT}" > /dev/null 2>&1; then
    echo -e "${BLUE}Preview already running at ${PREVIEW_URL}${NC}"
    return
  fi

  python3 -m http.server "${PREVIEW_PORT}" > /tmp/preview.log 2>&1 &
  echo -e "${GREEN}Preview running at ${PREVIEW_URL}${NC}"
}

.devcontainer/configure_git.sh < /dev/null

if command -v gh > /dev/null; then
  echo -e "${GREEN}GitHub CLI: $(gh --version | head -1)${NC}"
  echo -e "${BLUE}Sign in with: gh auth login${NC}"
else
  echo -e "${YELLOW}GitHub CLI (gh) not found${NC}" >&2
fi

start_preview
