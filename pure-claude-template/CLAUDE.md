# PROJECT_NAME

> **Pure Claude Code Orchestration - No External Dependencies**
> This template works with Claude Code alone. No Agent OS, no SuperClaude, just Claude.

## Uncertainty Protocol

When uncertain about ANYTHING:
```
STOP immediately
STATE: "I'm uncertain about [specific thing]"
ASK: "Should I [option A] or [option B]?"
WAIT for response

NEVER fake confidence or guess
```

## Git Branch Protocol

```
NEVER push to main directly
ALWAYS create PR
NEVER delete branches (preserve history)

Before starting work:
IF on main:
  CREATE feature/[name]
ELSE:
  ASK: "Branch from main or current?"
```

## Cache-First Knowledge Strategy

Before any research or file reading:
1. CHECK `.claude/docs/internal/patterns/` for established patterns
2. CHECK `.claude/docs/internal/solutions/` for solved problems  
3. CHECK `.claude/docs/external/` for cached API docs (<14 days old)
4. ONLY research externally as last resort

When discovering new patterns or solutions, immediately save to cache.

## Parallel Agent Execution

Launch multiple specialists simultaneously using natural language:

```markdown
"I need to implement user authentication. Launching team:

@Task: frontend-specialist - Build login/signup UI components
@Task: backend-specialist - Create authentication API endpoints
@Task: database-specialist - Set up user tables with security

[Agents work in parallel, coordinate through team-activity.md]"
```

## Natural Language Workflows

### Starting a New Feature
```
"Let's plan the [feature name] feature"

1. I'll think through requirements and architecture
2. Create parallel tasks for specialists
3. Present the plan for your approval
4. Execute with coordinated agents
```

### Coordinating Through Conversation

Agents leave notes in `.claude/handoffs/team-activity.md`:

```markdown
Frontend: "Login form ready at /components/auth/LoginForm.tsx
Expecting POST /api/auth/login with {email, password}"

Backend: "Endpoint ready. Returns {user, session, error?}
Using bcrypt for passwords, JWT for sessions"

QA: "Found accessibility issue with tab order in login form"

Frontend: "Fixed tab order, ready for re-review"
```

## Development Phases

### Phase 1: Understanding (Sequential)
- Analyze requirements
- Check cached patterns
- Identify technical approach
- Present plan for approval

### Phase 2: Building (Parallel)
- Launch specialist agents
- Natural language coordination
- Continuous quality checks
- Progress updates in handoffs

### Phase 3: Validation (Sequential)
- Test coverage verification
- Security review
- Performance checks
- Your final approval

## Smart Patterns

### Conditional Logic
```
IF database changes needed:
  CREATE database schema plan
ELSE:
  SKIP database planning

IF clarification needed:
  ASK numbered questions
  WAIT for response
ELSE:
  PROCEED with implementation
```

### Context Minimization
```
IF file already in context:
  SKIP reading
  REFERENCE existing content
ELSE IF small portion needed:
  Extract specific section
ELSE:
  READ file once, cache findings
```

### Task Loops
```
FOR each feature component:
  PARALLEL: Launch specialists
  COORDINATE: Via team-activity.md
  VALIDATE: Quality checks
  UPDATE: Progress status
END FOR
```

## Project Configuration

**Tech Stack**: [Your frameworks, database, UI libraries]
**Key Commands**: 
```bash
npm run dev        # Development server
npm run build      # Production build
npm test           # Run tests
```

**Project Structure**:
```
src/
├── components/    # UI components
├── app/          # Routes and pages
├── lib/          # Utilities
└── api/          # Backend logic
```

## Agent Specializations

**Building Agents** (work in parallel):
- `frontend-specialist`: UI components, client interactions
- `backend-specialist`: APIs, server logic, authentication
- `database-specialist`: Schema, queries, migrations
- `ai-specialist`: ML integrations, embeddings

**Support Agents** (handle routine tasks):
- `file-creator`: Batch create project structures
- `test-writer`: Generate comprehensive test suites
- `documentation`: Update docs and comments

**Quality Agents** (sequential gates):
- `qa-engineer`: Test and validate functionality
- `security-reviewer`: Audit for vulnerabilities
- `performance-optimizer`: Check speed and efficiency

## Orchestration Structure

```
.claude/                   # Standard Claude directory
├── docs/
│   ├── internal/
│   │   ├── patterns.md    # Reusable code patterns
│   │   ├── solutions.md   # Problem-solution pairs
│   │   └── decisions.md   # Architecture decisions
│   └── external/          # Cached external docs
├── handoffs/
│   └── team-activity.md  # Agent coordination log
└── context/
    └── current.md         # Current working context
```

## Quick Patterns

### Creating a New Feature
```
"Create a user profile feature"
→ Agents plan in parallel
→ You approve approach
→ Implementation begins
→ Quality gates check
→ Ready for deployment
```

### Fixing a Bug
```
"Fix the login redirect issue"
→ Analyze the problem
→ Check cached solutions
→ Implement fix
→ Verify with tests
```

### Refactoring Code
```
"Refactor the payment module for better performance"
→ Analyze current implementation
→ Design improvements
→ Parallel refactoring
→ Performance validation
```

## Quality Standards

- **PR Size**: Maximum 250 lines for reviewability
- **Test Coverage**: 100% for critical paths
- **Performance**: <200ms API response time
- **Security**: All issues block deployment
- **Documentation**: Update with code changes

## Decision Points

The system will pause for your input at:
1. After planning, before implementation
2. When clarification is needed
3. Before any destructive operations
4. After quality gates, before deployment

## Thinking Triggers

For complex problems, use these triggers:
- `think` - Standard analysis
- `think harder` - Deep architectural thinking
- `think step by step` - Systematic breakdown

---

Remember: This works with pure Claude Code. No external dependencies needed.

## important-instruction-reminders

ALWAYS check `.claude/docs/internal/patterns.md` before implementing new solutions.

CRITICAL: Use parallel agents for independent tasks. Coordinate through natural language.

IMPORTANT: Cache all discoveries. Never solve the same problem twice.