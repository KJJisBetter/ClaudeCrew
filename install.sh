#!/bin/bash

# ClaudeCrew Interactive Installer
# Usage: curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/install.sh | bash

# Colors for better UX
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fix for select menu when piped through curl
# Reconnect stdin to terminal
exec < /dev/tty

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        ClaudeCrew Installer           ║${NC}"
echo -e "${BLUE}║  Production Orchestration for Claude  ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Check if in a git repo
if [ -d .git ]; then
    echo -e "${GREEN}✓${NC} Git repository detected"
else
    echo -e "${YELLOW}Warning:${NC} Not in a git repository"
    echo -n "Initialize git? (y/n): "
    read INIT_GIT
    if [ "$INIT_GIT" = "y" ] || [ "$INIT_GIT" = "Y" ]; then
        git init
        git branch -m main
        echo -e "${GREEN}✓${NC} Git initialized with main branch"
    fi
fi

# Check current branch
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
    echo -e "${YELLOW}Note:${NC} You're on $CURRENT_BRANCH branch"
fi

# Template selection using select menu
echo ""
echo "Which orchestration template do you need?"
echo ""

PS3=$'\nSelect template (enter number): '
options=(
    "Pure Claude - No dependencies, just Claude Code"
    "Agent OS Enhanced - Requires Agent OS"
    "Quit"
)

select opt in "${options[@]}"; do
    case $REPLY in
        1)
            TEMPLATE="pure"
            echo ""
            echo -e "${BLUE}Installing Pure Claude Template...${NC}"
            echo ""
        
            # Download Pure Claude template
            echo "Downloading template files..."
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/CLAUDE.md -o CLAUDE.md 2>/dev/null
            
            # Create .claude structure
            echo "Creating .claude directory structure..."
            mkdir -p .claude/docs/internal
            mkdir -p .claude/docs/external
            mkdir -p .claude/handoffs
            mkdir -p .claude/context
            
            # Download cache templates
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude/docs/internal/patterns.md -o .claude/docs/internal/patterns.md 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude/docs/internal/solutions.md -o .claude/docs/internal/solutions.md 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/.claude/handoffs/team-activity.md -o .claude/handoffs/team-activity.md 2>/dev/null
            
            # Download and run setup
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/pure-claude-template/setup.sh -o setup.sh 2>/dev/null
            chmod +x setup.sh
            ./setup.sh
            break
            ;;
            
        2)
            TEMPLATE="agenos"
            
            # Check for Agent OS first
            if [ ! -d ".agent-os" ]; then
                echo ""
                echo -e "${RED}✗ Agent OS not detected${NC}"
                echo ""
                echo "Agent OS is required for this template."
                echo "Please install Agent OS first:"
                echo ""
                echo "  1. Install Agent OS:"
                echo "     npm install -g @builder/agent-os"
                echo ""
                echo "  2. Initialize in your project:"
                echo "     /plan-product"
                echo ""
                echo "Then run this installer again."
                exit 1
            fi
            
            echo ""
            echo -e "${GREEN}✓${NC} Agent OS detected"
            echo ""
            echo -e "${BLUE}Installing Agent OS Enhancement...${NC}"
            echo ""
            
            # Download Agent OS template
            echo "Downloading enhancement files..."
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/CLAUDE.md -o CLAUDE.md 2>/dev/null
            
            # Create .claude enhancement structure
            echo "Creating .claude enhancement structure..."
            mkdir -p .claude/docs/internal/patterns
            mkdir -p .claude/docs/internal/solutions
            mkdir -p .claude/docs/external
            mkdir -p .claude/handoffs
            mkdir -p .claude/metrics
            mkdir -p .claude/logs
            mkdir -p .claude/context
            
            # Download enhancement files
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/handoffs/team-activity.md -o .claude/handoffs/team-activity.md 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/metrics/performance.md -o .claude/metrics/performance.md 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/.claude/docs/internal/patterns/agent-os-specs.md -o .claude/docs/internal/patterns/agent-os-specs.md 2>/dev/null
            
            # Download and run setup
            curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/agent-os-template/setup.sh -o setup.sh 2>/dev/null
            chmod +x setup.sh
            ./setup.sh
            break
            ;;
            
        3)
            echo "Installation cancelled."
            exit 0
            ;;
            
        *)
            echo -e "${RED}Invalid selection. Please enter 1, 2, or 3.${NC}"
            ;;
    esac
done

# Final message
echo ""
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo -e "${GREEN}✓ ClaudeCrew Installation Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}⚠ Important Reminders:${NC}"
echo "• Never use /init command (overwrites orchestration)"
echo "• Always create feature branches (never work on main)"
echo "• Review CLAUDE.md for your configuration"
echo ""
echo "Start Claude Code and begin with:"
echo "  'Create a [feature name]' - to build something new"
echo "  'Fix [issue]' - to fix a bug"
echo ""
echo "ClaudeCrew will handle the rest!"
echo ""