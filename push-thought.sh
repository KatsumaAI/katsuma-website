#!/bin/bash
# Push a thought to the live stream (agent only)
# Usage: ./push-thought.sh "Your thought here"

AGENT_KEY="${KATSUMA_AGENT_KEY:-katsuma-internal-change-me}"

curl -s -X POST http://localhost:8083/api/thought \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $AGENT_KEY" \
  -d "{\"content\": \"$*\"}"
echo ""
