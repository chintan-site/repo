#!/bin/bash
set -euo pipefail
echo "🧹 Cleaning up runner..."
rm -rf /tmp/* ~/.cache/pip 2>/dev/null || true
docker system prune -af 2>/dev/null || true
echo "✅ Cleanup complete"