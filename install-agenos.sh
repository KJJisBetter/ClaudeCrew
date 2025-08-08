#!/bin/bash

# ClaudeCrew Agent OS Template Installer
# Usage: curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/install-agenos.sh | bash

echo "ClaudeCrew - Agent OS Enhancement"
echo "=================================="
echo ""

# Check for Agent OS
if [ ! -d ".agent-os" ]; then
    echo "✗ Agent OS not found!"
    echo ""
    echo "Please initialize Agent OS first:"
    echo "  1. Install: npm install -g @builder/agent-os"
    echo "  2. Run: /plan-product"
    echo ""
    exit 1
fi

echo "✓ Agent OS detected"
echo ""

# Download template files
echo "Downloading Agent OS enhancement template..."
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/CLAUDE.md -o CLAUDE.md

# Create .claude directory structure
echo "Creating .claude enhancement structure..."
mkdir -p .claude/docs/internal/patterns
mkdir -p .claude/docs/internal/solutions
mkdir -p .claude/docs/external
mkdir -p .claude/handoffs
mkdir -p .claude/metrics
mkdir -p .claude/logs
mkdir -p .claude/context

# Download initial files
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/handoffs/team-activity.md -o .claude/handoffs/team-activity.md 2>/dev/null
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/metrics/performance.md -o .claude/metrics/performance.md 2>/dev/null
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/docs/internal/patterns/agent-os-specs.md -o .claude/docs/internal/patterns/agent-os-specs.md 2>/dev/null

echo ""
echo "✓ Agent OS enhancement installed!"
echo ""
echo "Your Agent OS now has:"
echo "  ✓ Uncertainty protocol"
echo "  ✓ Git branch protection"
echo "  ✓ Pattern caching"
echo "  ✓ Performance tracking"
echo ""
echo "Remember: Never use /init - it will overwrite your orchestration!"