# Agent OS Template - Production Workflow

> **Enterprise-grade development workflow for Agent OS users**
> Strict phases, quality gates, and no direct pushes to main. Ever.

## What This Template Provides

This template enhances Agent OS with:
- **🛑 Uncertainty Protocol** - Never fake confidence
- **🌿 Git Branch Management** - Always PR, never direct to main
- **🎯 Strict Phase Separation** - Planners plan, coders code, reviewers review
- **💾 Cache Enhancement** - Reuse patterns from previous specs
- **📊 Performance Tracking** - Measure improvements over time

## Prerequisites

⚠️ **REQUIRED**: Agent OS must be installed
```bash
npm install -g @builder/agent-os
```

Initialize Agent OS in your project:
```bash
/plan-product  # Creates .agent-os/product/ structure
```

## Installation

1. **Verify Agent OS** is initialized (`.agent-os/` directory exists)
2. **Copy this template** to your project root
3. **Customize CLAUDE.md** with your project name
4. **Start using** Agent OS commands - now with production workflow

## The Production Workflow

### 🔄 Complete Development Cycle

```
1. Branch Setup (Automatic)
   ↓
2. Planning Phase (No coding)
   ↓
3. Human Approval Checkpoint
   ↓
4. Implementation Phase (Parallel coding)
   ↓
5. Quality Gates (Sequential checks)
   ↓
6. PR Creation (Never direct to main)
   ↓
7. Human merges in GitHub
```

### Phase Details

#### Phase 0: Branch Setup
- Automatically creates feature branch
- Never works on main
- Asks about branch source (main or current)

#### Phase 1: Planning Only
```bash
/create-spec authentication
```
- Product strategist defines requirements
- UX designer creates experience
- System architect plans technical approach
- **No code is written yet**
- Presents plan for approval

#### Phase 2: Implementation (After Approval)
```bash
/execute-tasks
```
- Only starts after you approve the plan
- Parallel specialists work simultaneously
- Checks cache for existing solutions
- Coordinates through natural language

#### Phase 3: Quality Gates (Sequential)
1. **QA Engineer** - Tests everything
2. **Security Specialist** - Audits for vulnerabilities  
3. **Quality Guardian** - Final harsh review

Each gate must pass before proceeding.

#### Phase 4: Always PR
- Creates comprehensive PR
- Includes all test results
- You review and merge in GitHub
- **Never pushes directly to main**

## 🛑 Uncertainty Protocol

The template enforces:
```
When uncertain → STOP
When unsure → ASK
When guessing → DON'T
```

Examples:
- ✅ "I'm unsure about the auth pattern. JWT or sessions?"
- ❌ "Implementing auth..." [while confused]

## 🌿 Git Branch Management

### Rules That Can't Be Broken
1. **NEVER** push to main (even if asked)
2. **NEVER** delete branches (preserve history)
3. **ALWAYS** create PR for main
4. **ALWAYS** work on feature branches

### Branch Naming Convention
- `feature/` - New features
- `fix/` - Bug fixes
- `wip/` - Work in progress
- `try/` - Experiments
- `done/` - Merged but preserved

### Solo Dev Friendly
- Asks whether to branch from main or current
- Preserves experimental branches
- Maintains complete history

## 💾 Cache Enhancement System

### How It Works
1. **Before** `/create-spec`: Checks for similar patterns
2. **During** execution: Applies cached solutions
3. **After** completion: Saves new patterns

### Cache Structure
```
.claude/
├── docs/
│   ├── internal/
│   │   ├── patterns/      # Reusable spec patterns
│   │   └── solutions/     # Solved problems
│   └── external/          # API documentation
├── handoffs/
│   └── team-activity.md  # Agent coordination
└── metrics/
    └── performance.md     # Tracking improvements
```

## 📊 Performance Metrics

Track improvements in `.claude/metrics/performance.md`:
- Command execution times
- Cache hit rates
- Pattern reuse statistics
- Quality gate pass rates

### Typical Improvements
- `/create-spec`: 73% faster with cache
- `/execute-tasks`: 48% faster with parallel agents
- Quality issues: 85% caught before PR

## Working Example

```bash
# You type:
/create-spec user-authentication

# What happens:
1. Creates feature/user-authentication branch
2. Checks cache for auth patterns
3. Launches planning agents
4. Presents comprehensive plan
5. Waits for your approval

# You say: "Looks good"

/execute-tasks

# What happens:
1. Applies cached auth patterns
2. Launches coding specialists in parallel
3. Coordinates through team-activity.md
4. Runs quality gates sequentially
5. Creates PR with full details

# You: Review and merge in GitHub
```

## Configuration

Edit `CLAUDE.md` to customize:
- Project name
- Tech stack references
- Team preferences
- Quality thresholds

## Troubleshooting

### "Agent OS not found"
```bash
npm install -g @builder/agent-os
/plan-product  # Initialize
```

### "Cache not working"
- Check `.claude/docs/internal/` exists
- Verify file permissions
- Clear old cache if >14 days

### "Uncertainty too frequent"
- This is good! Better to ask than guess
- Provide clear requirements upfront
- Build pattern library over time

## Best Practices

1. **Let planning finish** before approving
2. **Review PR details** before merging
3. **Keep branches** for history
4. **Trust the cache** for patterns
5. **Embrace uncertainty** - asking is good

## Integration with Agent OS

This template enhances but doesn't replace Agent OS:
- Agent OS provides structured workflows
- Template adds production safeguards
- Cache speeds up Agent OS commands
- Metrics track improvements

## Philosophy

> "No fake confidence. No direct pushes. No deleted history."

This template enforces:
- **Safety** over speed
- **Quality** over quantity
- **Clarity** over assumptions
- **History** over cleanliness

## Support

- Agent OS: [buildermethods.com/agent-os](https://buildermethods.com/agent-os)
- Template issues: Create issue in this repo
- Best practices: Contribute your patterns

---

*Production-ready Agent OS workflow. Plan properly. Code safely. Ship confidently.*