# ai-dev-workstation-mac
Modern AI Agent Development setup for macOS with VS Code and Homebrew

> **Living Document Notice:** This document automatically updates itself nightly with the latest tool versions, community trends, and emerging frameworks. Changes are committed automatically in addition to manual updates.

# Modern AI Agent Development Toolkit for macOS — July 18, 2025

> **Audience:** Developers using **VS Code Insiders** on macOS with GitHub Copilot (agent mode), Claude Code, Homebrew, and Azure resources.

---

## 1 · VS Code Insiders as the Control Center  

| Step | What to do | Why |
|------|------------|-----|
|1|Install **VS Code Insiders** via Homebrew: `brew install --cask visual-studio-code-insiders`|Daily insiders now ship improved chat‑mode diagnostics and tool‑hover support|
|2|Create a *Profile* called **"Agent‑Dev"** to isolate your extensions and settings from regular coding.|Keeps MCP servers and agent‑specific snippets from cluttering other workspaces.|
|3|Install **GitHub Copilot** extension and enable *Agent Mode* (`"github.copilot.chat.enable": true`).|Gives you model/tool routing in the chat sidebar.|

### MCP servers quick‑start

```jsonc
// .vscode/mcp.json
{
  "servers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"],
      "type": "stdio"
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

**When to spin up your own server**

| Create new MCP server when… | Re‑use an existing server when… |
|-----------------------------|---------------------------------|
|You need a custom tool (e.g., call an internal REST API, run a database query).|You just need vector search, retrieval, or memory that a generic server already exposes.|
|Security requires you to run on localhost and audit code.|You trust the community‑maintained implementation.|

GitHub's docs outline editing `mcp.json` in the *Tools* panel.

> **Gotcha**: Two servers listening on the **same port (3917)** will silently fail; always increment the port or kill the other process first.

---

## 2 · Choosing Your Coding Copilot  

| Tool | Strengths | Watch‑outs |
|------|-----------|-----------|
|**GitHub Copilot** (agent mode) | Deep VS Code integration, Azure SRE agent preview announced at Build 2025 | Chat context limited to ~16 k tokens unless MCP tooling expands it.|
|**Claude Code** extension | 200 k+ context, excels at refactors; can share MCP servers. | Must select the **Claude** sidebar; easy to think you're still in Copilot.|
|**Cursor** | Whole‑file edit commands, great for "make this async".|Adds a separate forked VS Code; ingesting large repos can cause battery drain.|

---

## 3 · Leading Agent Frameworks (Last 6 Months)

| Framework / Lib | Latest ver. | Killer features |
|-----------------|------------|-----------------|
|**CrewAI**|0.140.0 (Jul 9 2025)|Declarative YAML mission files, vector‑based memory, Agents → Roles → Tasks hierarchy.|
|**Microsoft Autogen**|0.2 (major rewrite)|Replay analytics, compliance hooks, VS Code debug adapter.|
|**LangGraph**|Templates & perf boosts|Graph‑style branching flows; easy to plug into LangChain tools.|
|**Semantic Kernel**|1.35.0 (Jul 15)|Process Framework (durable orchestration) + C#/**Python** parity.|
|**GPTScript Agents**|Bleeding‑edge|Script agents in 10 lines; great for Kubernetes ops.|
|**LLM CLI**|Active|Command-line interface for LLM interactions with plugins.|

---

## 4 · macOS‑centric Agent Development Setup

### Homebrew Package Manager

First, install Homebrew if you haven't already:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Essential Development Tools

```bash
# Core development tools
brew install python@3.11 node npm git

# AI/ML specific tools
brew install pipenv pyenv

# Optional: Database tools
brew install postgresql redis

# Optional: Container tools
brew install docker docker-compose
```

### Azure AI Foundry Integration

```bash
# Install Azure CLI
brew install azure-cli

# Install Azure AI Foundry SDK
pip install azure-ai-foundry

# Authenticate
az login
```

---

## 5 · Environment Strategy: Native macOS vs Docker vs Virtual Environments

| Scenario | Best choice | Rationale |
|----------|-------------|-----------|
|Python‑heavy agent dev, need native performance | **pyenv + pipenv** | Native macOS Python with isolated environments.|
|Stable, reproducible runtime for teams | **Docker Desktop** | Image pinning; runs same across platforms.|
|GPU workloads with Metal acceleration | **Native macOS** | Direct Metal API access for M1/M2 Macs.|
|Multiple Python versions | **pyenv** | Easy Python version switching.|

### Python Environment Management

```bash
# Install multiple Python versions
pyenv install 3.11.9
pyenv install 3.12.4
pyenv global 3.11.9

# Create isolated environments
pipenv install --python 3.11.9
pipenv shell

# Install AI frameworks
pipenv install crewai autogen-agentchat langgraph semantic-kernel
```

---

## 6 · Performance & Daily Ops Tips for macOS

- **Use Homebrew** for package management instead of manual downloads
- **Enable Rosetta 2** for Intel compatibility: `softwareupdate --install-rosetta`
- **Use Activity Monitor** to track resource usage of AI processes
- **Configure Terminal** with zsh and oh-my-zsh for better CLI experience
- **Use Spotlight** or Alfred for quick VS Code project launching

### Terminal Setup

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Useful aliases for AI development
echo 'alias code="code-insiders"' >> ~/.zshrc
echo 'alias python="python3"' >> ~/.zshrc
echo 'alias pip="pip3"' >> ~/.zshrc
```

---

## 7 · Where to Watch the Frontier  

| Community | Why follow |
|-----------|-----------|
|**OpenAI Developer Forum** | Early docs on Assistants API & function calling updates.|
|**LangChain Discord** | Rapid Q&A on LangGraph templates.|
|**Autogen GitHub Discussions** | Microsoft engineers share design patterns weekly.|
|**Azure AI Foundry Blog** | Enterprise agent governance & roadmap.|
|**Homebrew Formulae** | Track new AI/ML tools added to Homebrew.|

---

## 8 · Self-Updating Documentation System

This workstation includes automated weekly updates to keep your AI agent development environment current:

### Automated Update Features

| Component | What it does | Frequency |
|-----------|-------------|-----------|
|**Tool Version Tracking**|Checks PyPI, npm, and Homebrew for updates to all tracked frameworks|Weekly|
|**Community Monitoring**|Scans OpenAI forums, GitHub discussions, and Reddit for trending topics|Weekly|
|**Trending Tool Discovery**|Identifies new AI agent tools and frameworks gaining popularity|Weekly|
|**README Auto-Updates**|Updates version numbers and adds new trending tools to this document|Weekly|

### MCP Server Configuration

Your `.vscode/mcp.json` is configured with:
- **Context7** for enhanced AI context management
- **Memory server** for persistent agent sessions
- **Web search** for real-time information access
- **GitHub integration** for repository management
- **Filesystem access** for local development

### Running Updates

```bash
# Manual update (weekly automation recommended)
./scripts/weekly-update.sh

# Check individual components
python3 scripts/update-tools.py
python3 scripts/forum-monitor.py
```

### Setup Automation

```bash
# Set up weekly cron job (macOS)
echo "0 9 * * 1 cd /Users/$(whoami)/ai-dev-workstation-mac && ./scripts/weekly-update.sh" | crontab -

# Or use launchd for more advanced scheduling
```

---

## 9 · 30‑Second Setup Checklist for macOS

- [ ] Homebrew installed and updated
- [ ] VS Code Insiders installed via Homebrew
- [ ] Python 3.11+ installed via pyenv
- [ ] Node.js and npm installed
- [ ] GitHub Copilot extension installed
- [ ] `.vscode/mcp.json` configured with required environment variables
- [ ] Docker Desktop installed (optional)
- [ ] Azure CLI and credentials configured
- [ ] Weekly automation set up with `./scripts/weekly-update.sh`

> **Done!** You're ready to build and ship multi‑agent apps with a self-updating development environment on macOS.

---

## Environment Variables for MCP Servers

Create a `.env` file in your project root:

```bash
# Upstash Redis (for Context7)
UPSTASH_REDIS_REST_URL=your_redis_url
UPSTASH_REDIS_REST_TOKEN=your_redis_token

# Search API (for web search MCP)
SEARCH_API_KEY=your_google_search_api_key
SEARCH_ENGINE_ID=your_search_engine_id

# GitHub integration
GITHUB_TOKEN=your_github_personal_access_token
```

---

## macOS-Specific Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
|**Python not found** | Use `python3` explicitly or create alias |
|**Permission denied on scripts** | Run `chmod +x scripts/*.sh` |
|**Homebrew warnings** | Run `brew doctor` and follow suggestions |
|**M1/M2 compatibility** | Use `arch -arm64 brew install` for native packages |
|**Node.js version conflicts** | Use `nvm` to manage Node.js versions |

### Performance Optimization

```bash
# Check system resources
top -o cpu

# Monitor disk usage
df -h

# Clean up Homebrew
brew cleanup

# Update all packages
brew update && brew upgrade
```

---

*Generated July 18, 2025 – automatically updating weekly to keep pace with the evolving agentic toolbox on macOS.*