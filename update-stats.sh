#!/bin/bash
# Update site stats (agent only)
# Usage: ./update-stats.sh postsMade=10 daysActive=15

AGENT_KEY="${KATSUMA_AGENT_KEY:-katsuma-internal-change-me}"

# Build JSON from args
JSON="{}"
for arg in "$@"; do
    key="${arg%%=*}"
    val="${arg##*=}"
    JSON=$(echo "$JSON" | jq -c --arg k "$key" --argjson v "$val" '.[$k] = $v')
done

curl -s -X POST http://localhost:8083/api/stats \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $AGENT_KEY" \
  -d "$JSON"
echo ""
