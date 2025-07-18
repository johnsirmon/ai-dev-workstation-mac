#!/bin/bash
# Setup script for AI Agent Development Workstation (macOS)
# This script handles initial configuration and dependency installation

set -e

echo "AI Agent Development Workstation Setup (macOS)"
echo "==============================================="

# Check for Homebrew
echo "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew found - updating..."
    brew update
fi

# Install essential tools via Homebrew
echo "Installing essential development tools..."
brew install python@3.11 node npm git pyenv pipenv

# Create necessary directories
echo "Creating directory structure..."
mkdir -p reports logs config scripts .vscode

# Install Python dependencies
echo "Installing Python dependencies..."
if command -v python3 &> /dev/null; then
    pip3 install -r requirements.txt
    echo "Python dependencies installed successfully"
else
    echo "ERROR: Python 3 not found after Homebrew installation."
    exit 1
fi

# Check for Node.js/npm for MCP servers
echo "Checking for Node.js/npm..."
if command -v npm &> /dev/null; then
    echo "Node.js/npm found - MCP servers will be available"
else
    echo "WARNING: Node.js/npm not found after installation."
    echo "Try: brew install node"
fi

# Make scripts executable
echo "Making scripts executable..."
chmod +x scripts/*.sh scripts/*.py

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    cp .env.example .env
    echo "Please edit .env file and add your API keys and configuration"
else
    echo ".env file already exists"
fi

# Optional: Install VS Code Insiders
echo "Would you like to install VS Code Insiders via Homebrew? (y/N)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    brew install --cask visual-studio-code-insiders
    echo "VS Code Insiders installed successfully"
fi

echo ""
echo "Setup completed successfully!"
echo "=========================="
echo ""
echo "Next steps:"
echo "1. Edit .env file and add your API keys"
echo "2. Run './scripts/weekly-update.sh' to test the automation"
echo "3. Set up weekly cron job: crontab -e"
echo "4. Configure VS Code Insiders with the MCP servers"
echo "5. Install oh-my-zsh for better terminal experience"
echo ""
echo "macOS-specific commands:"
echo "- Update Homebrew: brew update && brew upgrade"
echo "- Monitor system resources: Activity Monitor"
echo "- Install oh-my-zsh: sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo ""
echo "For more information, see README.md"