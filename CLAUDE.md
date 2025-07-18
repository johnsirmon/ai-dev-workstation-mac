# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an AI development workstation setup repository focused on modern AI agent development using VS Code Insiders on macOS. The project serves as a comprehensive guide for developers working with AI agents, MCP servers, and various AI frameworks on macOS using Homebrew and native macOS tools.

## Key Architecture Components

### Development Environment Stack
- **VS Code Insiders** as the primary IDE with agent-specific profiles
- **Homebrew** for package management on macOS
- **Python via pyenv** for version management and virtual environments
- **GitHub Copilot** (agent mode) and **Claude Code** as AI coding assistants
- **MCP (Model Context Protocol)** servers for enhanced AI capabilities
- **Azure AI Foundry** integration for enterprise agent deployment

### MCP Server Configuration
The repository references MCP server setup in `.vscode/mcp.json` with servers like:
- `context7` for enhanced context management
- `memory` for persistent memory across sessions
- `web-search` for real-time information access
- `github` for repository management
- `filesystem` for local development access

### Supported AI Frameworks
The documentation covers multiple agent frameworks:
- **CrewAI** (0.140.0) - Declarative YAML mission files
- **Microsoft Autogen** (0.2) - Replay analytics and compliance hooks
- **LangGraph** - Graph-style branching flows
- **Semantic Kernel** (1.35.0) - Process Framework with C#/Python parity
- **GPTScript Agents** - Script agents for Kubernetes operations

## Environment Setup Commands

### Homebrew Installation
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install core development tools
brew install python@3.11 node npm git pyenv pipenv
```

### Python Environment Management
```bash
# Install and configure pyenv
pyenv install 3.11.9
pyenv global 3.11.9

# Create project environment
pipenv install --python 3.11.9
pipenv shell
```

### Azure AI Foundry Setup
```bash
# Install Azure CLI
brew install azure-cli

# Install Azure AI Foundry SDK
pip install azure-ai-foundry

# Authenticate
az login
```

### VS Code Integration
```bash
# Install VS Code Insiders via Homebrew
brew install --cask visual-studio-code-insiders

# Launch VS Code Insiders
code-insiders .
```

## Development Workflow

### Package Management
- Use Homebrew for system-level packages and tools
- Use pyenv for Python version management
- Use pipenv for project-specific Python environments
- Use npm for Node.js packages and MCP servers

### Performance Optimization
- Monitor system resources with Activity Monitor
- Use native macOS tools for better performance
- Leverage Metal GPU acceleration for M1/M2 Macs
- Keep Homebrew packages updated regularly

## Project Structure

This is primarily a documentation and configuration repository with:
- `README.md` - Comprehensive macOS setup guide and framework comparisons
- `.vscode/mcp.json` - MCP server configurations with macOS paths
- `scripts/` - Automation scripts adapted for macOS
- `config/` - Tool tracking configuration with Homebrew formulae

## Common Tasks

Since this is a documentation repository, common tasks involve:
1. Updating framework version information via Homebrew
2. Adding new MCP server configurations
3. Expanding macOS-specific setup instructions
4. Adding new AI framework integrations
5. Monitoring Homebrew formulae for new AI/ML tools

## Important Notes

- MCP servers on the same port (3917) will silently fail - always increment ports
- Use pyenv + pipenv for Python development instead of system Python
- Keep Homebrew updated with `brew update && brew upgrade`
- Monitor performance with Activity Monitor for resource-intensive AI processes
- Use `$HOME` paths for user-specific configurations
- Follow the macOS setup checklist for quick environment validation

## macOS-Specific Features

### Homebrew Integration
- Automatic checking of Homebrew formulae for version updates
- Integration with system package management
- Support for both formulae and casks

### Native macOS Tools
- Activity Monitor for resource monitoring
- Spotlight/Alfred integration for quick project access
- Terminal with zsh and oh-my-zsh configuration
- Rosetta 2 support for Intel compatibility on Apple Silicon

### Apple Silicon Optimization
- Native ARM64 packages where available
- Metal GPU acceleration for AI workloads
- Optimized performance for M1/M2 processors