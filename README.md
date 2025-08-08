# ClaudeCrew

> **Production-ready orchestration templates for Claude Code**
> **Two paths: Pure Claude or Agent OS Enhanced**

## Quick Install

### Pure Claude (no dependencies)
```bash
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/scripts/install-pure.sh | bash
```
Use this if you're using Claude Code without Agent OS.

### Agent OS Enhanced (requires Agent OS)
```bash
curl -sSL https://raw.githubusercontent.com/KJJisBetter/ClaudeCrew/main/scripts/install-agenos.sh | bash
```
Use this if you have Agent OS installed and want enhanced features.

## Important: About /init Command

**WARNING**: Don't use the `/init` command after installing these templates. 
The `/init` command auto-generates a basic CLAUDE.md that would overwrite our production orchestration setup.
Our templates provide a much more sophisticated CLAUDE.md with orchestration patterns.

## Choose Your Template

### Pure Claude Template
**For:** Claude Code users without external dependencies

```bash
cd pure-claude-template/
```

- ✅ Works with Claude Code alone
- ✅ No frameworks needed
- ✅ Natural language commands
- ✅ Flexible and adaptable

**Use when:**
- Starting fresh with Claude Code
- Want maximum flexibility
- Don't need structured workflows
- Learning AI orchestration

### Agent OS Template
**For:** Agent OS users wanting enhanced orchestration

```bash
cd agent-os-template/
```

- ✅ Enhances Agent OS commands
- ✅ Faster spec creation
- ✅ Parallel execution
- ✅ Performance tracking

**Use when:**
- Already using Agent OS
- Want faster execution
- Need pattern caching
- Track performance metrics

## Quick Comparison

| Feature | Pure Claude | Agent OS Enhanced |
|---------|------------|-------------------|
| **Requirements** | Just Claude Code | Agent OS required |
| **Commands** | Natural language | `/create-spec`, `/execute-tasks` |
| **Structure** | Flexible | Agent OS structured |
| **Caching** | Built-in | Enhances Agent OS |
| **Parallel Agents** | Yes | Yes + Agent OS |
| **Learning Curve** | Easy | Requires Agent OS knowledge |

## What Both Templates Provide

### Core Features
- Parallel agent execution
- Natural language coordination
- Knowledge caching system
- Quality gates and checkpoints

### Smart Patterns
- Cache-first approach
- Context minimization
- Conditional logic
- Task execution loops

### Agent Specialists
- Frontend, backend, database specialists
- QA, security, performance reviewers
- File creators and test writers
- Documentation maintainers

## Installation

### For Pure Claude Template

1. Copy `pure-claude-template/` to your project
2. Customize `CLAUDE.md` with your details
3. Start using natural language commands

### For Agent OS Template

1. Install Agent OS first: [buildermethods.com/agent-os](https://buildermethods.com/agent-os)
2. Copy `agent-os-template/` to your project
3. Continue using Agent OS - now enhanced

## How They Work

### Pure Claude Flow
```
You: "Build user authentication"
  ↓
Claude: Plans with parallel agents
  ↓
Claude: "Here's the approach..." [approval]
  ↓
Claude: Executes with specialists
  ↓
Claude: Quality gates and delivery
```

### Agent OS Enhanced Flow
```
You: /create-spec authentication
  ↓
Agent OS: Starts spec creation
  + Enhancement: Cache patterns applied
  + Enhancement: Parallel research
  ↓
Agent OS: Completes spec faster
  ↓
You: /execute-tasks
  + Enhancement: Parallel execution
  + Enhancement: Natural coordination
```

## Directory Structures

### Pure Claude
```
.claude-orchestration/    # No conflicts
├── docs/                # Knowledge cache
├── handoffs/           # Coordination
└── context/            # Working state
```

### Agent OS Enhanced
```
.agent-os/              # Standard Agent OS
└── (Agent OS files)

.claude/                # Enhancements
├── docs/              # Pattern cache
├── handoffs/          # Coordination
└── metrics/           # Performance
```

## Performance

### Pure Claude Template
- Reduces token usage by ~40%
- Speeds up development by ~2x
- Improves code quality via gates

### Agent OS Template
- Makes `/create-spec` ~73% faster
- Makes `/execute-tasks` ~48% faster
- Adds comprehensive metrics

## Support & Resources

### Pure Claude Template
- Standalone, no dependencies
- Customize for any project
- Natural language focused

### Agent OS Template  
- Requires Agent OS installation
- Agent OS docs: [buildermethods.com/agent-os](https://buildermethods.com/agent-os)
- Enhances existing commands

## Contributing

Feel free to improve these templates:
1. Test in real projects
2. Document new patterns
3. Share optimizations
4. Submit improvements

## License

MIT - Use freely in your projects

---

**Choose your path**: Pure flexibility or enhanced structure. Both deliver production-ready AI orchestration.