# Pure Claude Template

> **Claude Code orchestration without any external dependencies**
> Works with Claude Code alone - no Agent OS, no SuperClaude, just pure Claude.

## What This Is

A complete orchestration template that enables:
- Parallel agent execution using Claude's Task tool
- Natural language coordination between specialists  
- Knowledge caching to avoid repeated work
- Quality gates for production-ready code

## Who This Is For

- Developers using Claude Code without other frameworks
- Teams wanting AI orchestration without learning Agent OS
- Projects that need flexibility over rigid structure
- Anyone starting with AI-assisted development

## Quick Start

1. **Copy this template to your project root**
2. **Customize CLAUDE.md** with your project details
3. **Start using natural language commands**

## How It Works

### No Special Commands Needed

Just describe what you want:
```
"Create a user authentication system"
"Fix the performance issues in the dashboard"  
"Refactor the payment module"
```

Claude will:
1. Plan the approach using parallel specialists
2. Present the plan for your approval
3. Execute with coordinated agents
4. Run quality checks
5. Prepare for deployment

### Parallel Execution

Claude launches multiple specialists simultaneously:
```markdown
@Task: frontend-specialist - "Build the UI"
@Task: backend-specialist - "Create the API"
@Task: database-specialist - "Design the schema"
```

### Natural Coordination

Agents coordinate through conversation in `.claude-orchestration/handoffs/team-activity.md`:
```
Frontend: "Form ready, expecting POST /api/login"
Backend: "Endpoint ready, returns {user, session}"
```

## Directory Structure

```
your-project/
├── CLAUDE.md                         # Main orchestration file
├── .claude-orchestration/            # Orchestration system
│   ├── docs/
│   │   ├── internal/
│   │   │   ├── patterns.md          # Reusable patterns
│   │   │   └── solutions.md         # Cached solutions
│   │   └── external/                # External doc cache
│   ├── handoffs/
│   │   └── team-activity.md        # Agent coordination
│   └── context/
│       └── current.md               # Working context
└── src/                             # Your code
```

## Features

### Cache-First Approach
- Check cached patterns before implementing
- Save solutions for future reuse
- Never solve the same problem twice

### Smart Context Management  
- Skip reading files already in context
- Extract only needed portions
- Minimize token usage

### Quality Gates
- Test coverage validation
- Security review
- Performance checks
- Your final approval

### Thinking Triggers
- `think` - Standard analysis
- `think harder` - Deep architectural thinking
- `think step by step` - Systematic breakdown

## No Dependencies Required

This template works with:
- ✅ Pure Claude Code
- ❌ No Agent OS needed
- ❌ No SuperClaude needed
- ❌ No external tools needed

## Getting Started

1. **Initialize**: Copy template to your project
2. **Customize**: Update CLAUDE.md with your tech stack
3. **First Feature**: Say "Let's build [feature name]"
4. **Watch**: Claude orchestrates everything

## Examples

### Creating a Feature
```
You: "Create a notification system"
Claude: [Plans with parallel agents]
Claude: "Here's the approach..." [Waits for approval]
You: "Looks good"
Claude: [Executes with coordinated specialists]
```

### Fixing a Bug
```
You: "Fix the memory leak in the dashboard"
Claude: [Analyzes, checks cache, implements fix]
```

### Refactoring
```
You: "Refactor for better performance"
Claude: [Analyzes, designs improvements, refactors]
```

## Tips

- Let Claude coordinate agents naturally
- Trust the cache-first approach
- Review at checkpoints
- Save successful patterns

## Support

This is a standalone template. Customize it for your needs.
Works with any project type, any language, any framework.

---

*Pure Claude orchestration. No dependencies. Just natural language.*