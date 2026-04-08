#!/bin/bash
set -euo pipefail
echo "🔧 Setting up runtime environment..."
mkdir -p output
sudo apt-get update -qq
# Add dependencies here, e.g.:
# sudo apt-get install -y jq curl python3
echo "✅ Setup complete"