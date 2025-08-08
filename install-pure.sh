#!/bin/bash

# ClaudeCrew Pure Claude Template Installer
# Usage: curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/install-pure.sh | bash

echo "ClaudeCrew - Pure Claude Template"
echo "=================================="
echo ""

# Download template files
echo "Downloading Pure Claude template..."
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/CLAUDE.md -o CLAUDE.md
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/setup.sh -o setup.sh
chmod +x setup.sh

# Create .claude directory structure
echo "Creating .claude directory structure..."
mkdir -p .claude/docs/internal
mkdir -p .claude/docs/external
mkdir -p .claude/handoffs
mkdir -p .claude/context

# Download initial cache files
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude-orchestration/docs/internal/patterns.md -o .claude/docs/internal/patterns.md 2>/dev/null
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude-orchestration/docs/internal/solutions.md -o .claude/docs/internal/solutions.md 2>/dev/null
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude-orchestration/handoffs/team-activity.md -o .claude/handoffs/team-activity.md 2>/dev/null

# Run setup
echo ""
echo "Running setup..."
./setup.sh

echo ""
echo "✓ Pure Claude template installed!"
echo ""
echo "Remember: Never use /init - it will overwrite your orchestration!"