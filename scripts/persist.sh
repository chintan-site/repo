#!/bin/bash
set -euo pipefail
echo "💾 Persisting results and state..."

# Update checkpoint
NEW_CURSOR=$(jq -r '.cursor // "null"' output/results.json 2>/dev/null || echo "null")
jq -n \
  --arg ver "$(jq -r '.version' checkpoint.json)" \
  --arg cur "$NEW_CURSOR" \
  --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  '{version: ($ver | tonumber + 1), cursor: $cur, last_run: $ts}' > checkpoint.new.json

# Push to external storage
curl -sf -X POST "$STATE_URL/checkpoint" \
  -H "Content-Type: application/json" \
  -d @checkpoint.new.json || echo "⚠️ State persistence failed"

curl -sf -X POST "$RESULTS_URL/ingest" \
  -H "Content-Type: application/json" \
  -d @output/results.json || echo "⚠️ Results upload failed"

mv checkpoint.new.json checkpoint.json
echo "✅ Persistence complete"