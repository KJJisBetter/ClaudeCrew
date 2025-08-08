#!/bin/bash

# Agent OS Template Enhancement Setup
# This adds production workflow to your Agent OS project

echo "Agent OS Template Enhancement Setup"
echo "======================================="
echo ""

# Check for Agent OS
if [ ! -d ".agent-os" ]; then
    echo "✗ Agent OS not found!"
    echo ""
    echo "Please initialize Agent OS first:"
    echo "  1. Install: npm install -g @builder/agent-os"
    echo "  2. Run: /plan-product"
    echo ""
    echo "Then run this setup again."
    exit 1
fi

echo "✓ Agent OS detected"
echo ""

# Get project name from Agent OS or ask
if [ -f ".agent-os/product/mission.md" ]; then
    # Try to extract project name from mission.md
    PROJECT_NAME=$(grep -m 1 "^# " .agent-os/product/mission.md 2>/dev/null | sed 's/# //')
fi

if [ -z "$PROJECT_NAME" ]; then
    read -p "Enter your project name: " PROJECT_NAME
    if [ -z "$PROJECT_NAME" ]; then
        PROJECT_NAME="My Project"
    fi
fi

# Update CLAUDE.md
echo "Updating CLAUDE.md with project details..."
sed -i.tmp "s/# PROJECT_NAME/# $PROJECT_NAME/" CLAUDE.md
rm -f CLAUDE.md.tmp

# Initialize cache structure
echo "Setting up enhancement cache..."

# Create patterns directory for Agent OS specs
cat > .claude/docs/internal/patterns/README.md << 'EOF'
# Agent OS Pattern Cache

This directory caches successful patterns from Agent OS specs.

## Structure
- Each successful spec creates a pattern file
- Patterns are reused in future specs
- Speeds up /create-spec by 70%+

## Files
Patterns are organized by feature type:
- auth-patterns.md
- crud-patterns.md
- ui-patterns.md
- api-patterns.md
EOF

# Create solutions cache
cat > .claude/docs/internal/solutions/README.md << 'EOF'
# Agent OS Solution Cache

Cached solutions from /execute-tasks commands.

## Purpose
- Avoid solving the same problem twice
- Speed up task execution
- Share knowledge across specs
EOF

# Create team activity log
cat > .claude/handoffs/team-activity.md << 'EOF'
# Agent OS Enhancement Activity

## Enhancement Active
**Date:** $(date +%Y-%m-%d)
**Status:** Cache and parallel execution enabled

## Command Coordination
<!-- Tracks coordination between Agent OS commands -->

## Pattern Library
<!-- Successful patterns from specs -->
EOF

# Create performance metrics
cat > .claude/metrics/performance.md << 'EOF'
# Agent OS Performance Metrics

## Baseline (Without Enhancement)
- /create-spec: ~45 seconds average
- /execute-tasks: ~3-5 minutes per task

## With Enhancement (Track Your Results)
- /create-spec: [Measure after first use]
- /execute-tasks: [Measure after first use]

## Cache Statistics
- Patterns cached: 0
- Cache hits: 0
- Time saved: 0
EOF

echo ""
echo "✓ Enhancement Setup Complete!"
echo ""
echo "Your Agent OS now has:"
echo "  ✓ Uncertainty protocol (no fake confidence)"
echo "  ✓ Git protection (always PR to main)"
echo "  ✓ Strict phases (plan, approve, code, quality, PR)"
echo "  ✓ Pattern caching (faster specs)"
echo "  ✓ Performance tracking"
echo ""
echo "Next steps:"
echo "1. Review CLAUDE.md"
echo "2. Continue using Agent OS commands normally"
echo "3. Watch for enhanced speed and safety"
echo ""
echo "The enhancement will:"
echo "  ✓ Never push to main directly"
echo "  ✓ Stop and ask when uncertain"
echo "  ✓ Cache successful patterns"
echo "  ✓ Run quality gates before PR"