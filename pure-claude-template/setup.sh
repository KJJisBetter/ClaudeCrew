#!/bin/bash

# Pure Claude Template Setup Script
# This script helps you customize the template for your project

echo "Pure Claude Template Setup"
echo "=============================="
echo ""

# Get project name
read -p "Enter your project name: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="My Project"
fi

# Get project description
read -p "Brief project description: " PROJECT_DESC
if [ -z "$PROJECT_DESC" ]; then
    PROJECT_DESC="A project using Claude orchestration"
fi

# Get tech stack
echo ""
echo "What's your primary framework?"
echo "1) Next.js"
echo "2) React"
echo "3) Node.js"
echo "4) Python/Django"
echo "5) Ruby on Rails"
echo "6) Other"
read -p "Select (1-6): " FRAMEWORK_CHOICE

case $FRAMEWORK_CHOICE in
    1) FRAMEWORK="Next.js"; COMMANDS="npm run dev\nnpm run build\nnpm test" ;;
    2) FRAMEWORK="React"; COMMANDS="npm start\nnpm run build\nnpm test" ;;
    3) FRAMEWORK="Node.js"; COMMANDS="npm start\nnpm test\nnpm run dev" ;;
    4) FRAMEWORK="Python/Django"; COMMANDS="python manage.py runserver\npython manage.py test\npython manage.py migrate" ;;
    5) FRAMEWORK="Ruby on Rails"; COMMANDS="rails server\nrails test\nrails db:migrate" ;;
    *) 
        read -p "Enter your framework: " FRAMEWORK
        COMMANDS="[Add your commands here]"
        ;;
esac

# Get database
echo ""
echo "What database are you using?"
echo "1) PostgreSQL"
echo "2) MySQL"
echo "3) MongoDB"
echo "4) SQLite"
echo "5) Supabase"
echo "6) None/Other"
read -p "Select (1-6): " DB_CHOICE

case $DB_CHOICE in
    1) DATABASE="PostgreSQL" ;;
    2) DATABASE="MySQL" ;;
    3) DATABASE="MongoDB" ;;
    4) DATABASE="SQLite" ;;
    5) DATABASE="Supabase" ;;
    *) 
        read -p "Enter your database (or 'None'): " DATABASE
        ;;
esac

# Update CLAUDE.md
echo ""
echo "Updating CLAUDE.md with your project details..."

# Create backup (in case user runs /init later)
cp CLAUDE.md CLAUDE.orchestration.backup 2>/dev/null
echo "Backup saved to CLAUDE.orchestration.backup (restore if /init overwrites)"

# Update project name
sed -i.tmp "s/# PROJECT_NAME/# $PROJECT_NAME/" CLAUDE.md

# Update project description (if it exists in template)
sed -i.tmp "s/\[brief project description\]/$PROJECT_DESC/" CLAUDE.md

# Update tech stack section
sed -i.tmp "s/\*\*Tech Stack\*\*: \[Your frameworks, database, UI libraries\]/\*\*Tech Stack\*\*: $FRAMEWORK, $DATABASE/" CLAUDE.md

# Update commands section
sed -i.tmp "s|npm run dev.*# Development server|npm run dev        # Development server|" CLAUDE.md

# Clean up temp files
rm -f CLAUDE.md.tmp

# Create initial cache files
echo ""
echo "Setting up cache structure..."

# Create patterns file with starter content
cat > .claude/docs/internal/patterns.md << 'EOF'
# Reusable Patterns

## Project Patterns
<!-- Patterns specific to your project will be added here -->

## Code Style
<!-- Your coding patterns will be captured here -->

## Architecture Patterns
<!-- Architectural decisions and patterns -->
EOF

# Create solutions file
cat > .claude/docs/internal/solutions.md << 'EOF'
# Problem-Solution Cache

## Solved Problems
<!-- Solutions to problems will be cached here -->

## Common Fixes
<!-- Frequent fixes and workarounds -->
EOF

# Create team activity file
cat > .claude/handoffs/team-activity.md << 'EOF'
# Team Activity Log

## Project Start
**Date:** $(date +%Y-%m-%d)
**Status:** Template initialized

## Coordination Log
<!-- Agent coordination happens here -->
EOF

# Create context file
cat > .claude/context/current.md << 'EOF'
# Current Context

## Active Branch
main

## Current Task
Template setup complete

## Notes
<!-- Working notes go here -->
EOF

echo ""
echo "✓ Setup Complete!"
echo ""
echo "Your Pure Claude template is ready with:"
echo "  ✓ Project: $PROJECT_NAME"
echo "  ✓ Framework: $FRAMEWORK"
echo "  ✓ Database: $DATABASE"
echo ""
echo "Next steps:"
echo "1. Review CLAUDE.md to ensure settings are correct"
echo "2. Start Claude Code in this directory"
echo "3. Say: 'Let's build [your first feature]'"
echo ""
echo "The template will:"
echo "  ✓ Create feature branches automatically"
echo "  ✓ Never push to main (always PR)"
echo "  ✓ Cache patterns for reuse"
echo "  ✓ Stop and ask when uncertain"