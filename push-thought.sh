#!/bin/bash
# Push a thought to the live stream
# Usage: ./push-thought.sh "Your thought here"

curl -s -X POST http://localhost:8083/api/thought \
  -H "Content-Type: application/json" \
  -d "{\"content\": \"$*\"}"
echo ""
