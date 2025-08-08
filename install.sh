#!/bin/bash

# ClaudeCrew Quick Installer
# Usage: curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/install.sh | bash

echo "ClaudeCrew Installer"
echo "===================="
echo ""

# Check if we're in a git repository
if [ -d .git ]; then
    echo "✓ Git repository detected"
else
    echo "✗ Not a git repository. Initialize with 'git init' first."
    exit 1
fi

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
    echo "Warning: You're on $CURRENT_BRANCH branch. Consider creating a feature branch."
fi

# Ask which template
echo ""
echo "Which template do you want to install?"
echo "1) Pure Claude (no dependencies)"
echo "2) Agent OS Enhanced (requires Agent OS)"
echo ""
read -p "Select (1 or 2): " TEMPLATE_CHOICE

case $TEMPLATE_CHOICE in
    1)
        TEMPLATE="pure-claude-template"
        echo ""
        echo "Installing Pure Claude Template..."
        ;;
    2)
        TEMPLATE="agent-os-template"
        # Check for Agent OS
        if [ ! -d ".agent-os" ]; then
            echo ""
            echo "✗ Agent OS not found!"
            echo "Please install Agent OS first:"
            echo "  npm install -g @builder/agent-os"
            echo "  /plan-product"
            exit 1
        fi
        echo ""
        echo "✓ Agent OS detected"
        echo "Installing Agent OS Enhancement Template..."
        ;;
    *)
        echo "Invalid choice. Please run again and select 1 or 2."
        exit 1
        ;;
esac

# Download the template
echo ""
echo "Downloading ClaudeCrew $TEMPLATE..."

# Create temp directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Clone just the template we need
git clone --depth 1 --filter=blob:none --sparse \
    https://github.com/KJJisBetter/ClaudeCrew.git
cd ClaudeCrew
git sparse-checkout set $TEMPLATE

# Go back to original directory
cd - > /dev/null
ORIGINAL_DIR=$(pwd)

# Copy template files to project root
echo "Installing template files..."
cp -r "$TEMP_DIR/ClaudeCrew/$TEMPLATE/"* "$ORIGINAL_DIR/" 2>/dev/null
cp -r "$TEMP_DIR/ClaudeCrew/$TEMPLATE/".* "$ORIGINAL_DIR/" 2>/dev/null

# Clean up temp directory
rm -rf "$TEMP_DIR"

# Run the setup script
echo ""
echo "Running setup..."
if [ -f "./setup.sh" ]; then
    chmod +x ./setup.sh
    ./setup.sh
else
    echo "✗ Setup script not found"
    exit 1
fi

echo ""
echo "✓ ClaudeCrew installation complete!"
echo ""
echo "Remember: Never use /init command - it will overwrite your orchestration!"