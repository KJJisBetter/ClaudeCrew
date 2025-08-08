# PROJECT_NAME

> **Agent OS Enhanced with Production Workflow**

## Uncertainty Protocol - CRITICAL

When uncertain about ANYTHING:
```
STOP immediately
STATE: "I'm uncertain about [specific thing]"
ASK: "Should I [option A] or [option B]?"
WAIT for response

NEVER:
- Guess and hope
- Write code you're unsure about  
- Pretend to know
- Make assumptions
- Show fake confidence
```

Examples:
- ❌ "Implementing auth..." [while unsure]
- ✅ "I'm unsure which auth pattern you prefer. JWT or sessions?"

## Git Branch Protocol - NO EXCEPTIONS

### Branch Creation Rules
```
BEFORE any work:
CHECK current branch
IF main:
  CREATE feature/[descriptive-name]
  SWITCH to new branch
ELSE:
  ASK: "Create branch from main or current [branch-name]?"
  WAIT for answer
  CREATE based on response
```

### Absolute Rules
- **NEVER** push to main directly (even if user asks)
- **NEVER** delete branches (preserve history)
- **ALWAYS** create PR for main
- **ALWAYS** work on feature branches

### Branch Naming (Solo Dev Friendly)
- `feature/` - Planned features
- `fix/` - Bug fixes
- `wip/` - Work in progress
- `try/` - Experiments
- `done/` - Merged but preserved

## Agent OS Integration

### Load Context First
- @.agent-os/product/mission.md
- @.agent-os/product/tech-stack.md
- @.agent-os/product/roadmap.md
- @~/.agent-os/instructions/create-spec.md
- @~/.agent-os/instructions/execute-tasks.md

### Check Cache Before Work
- @.claude/docs/internal/patterns/
- @.claude/docs/internal/solutions/
- @.claude/handoffs/team-activity.md

## Strict Development Phases

### Phase 0: Branch Setup (Always First)
```
CHECK git status
IF on main:
  CREATE feature/[spec-name]
  SWITCH to feature branch
ELSE:
  ASK: "Currently on [branch]. Create new branch from main or continue here?"
  HANDLE based on response
```

### Phase 1: Planning Only (No Code Yet)
```
IF user requests feature:
  IF uncertain about requirements:
    ASK clarifying questions
    WAIT for answers
  
  PARALLEL LAUNCH (planners only):
  @Task: product-strategist - "Define requirements and user stories"
  @Task: ux-designer - "Design user experience and flows"
  @Task: system-architect - "Plan technical architecture"
  
  WAIT for all planners
  COMPILE plan from .claude/handoffs/team-activity.md
  PRESENT comprehensive plan
  
  ASK: "Does this plan look good?"
  WAIT for approval
  STOP until approved
```

### Phase 2: Implementation (After Approval Only)
```
ONLY after explicit approval:

CHECK .claude/docs/internal/solutions/ for similar implementations
IF found:
  APPLY cached patterns
  
PARALLEL LAUNCH (coders only):
@Task: frontend-specialist - "Build UI components"
@Task: backend-specialist - "Create API endpoints"
@Task: database-specialist - "Set up data layer"

COORDINATE through .claude/handoffs/team-activity.md
Natural language updates between agents

IF any coder uncertain:
  STOP that agent
  ESCALATE uncertainty to user
  WAIT for clarification
```

### Phase 3: Quality Gates (Sequential - Must Pass)
```
RUN in strict order:

1. @Task: qa-engineer - "Test all functionality"
   IF tests fail:
     STOP
     REPORT failures
     ASK: "Should I fix these test failures?"
   
2. @Task: security-specialist - "Security audit"
   IF vulnerabilities found:
     STOP
     REPORT security issues
     ASK: "How should I address these security concerns?"
   
3. @Task: quality-guardian - "Final harsh review"
   IF quality issues:
     STOP
     REPORT issues
     ASK: "Should I refactor to address these?"

ALL must pass before proceeding
```

### Phase 4: Deployment Decision (Always PR)
```
AFTER all quality gates pass:

STATE: "All checks passed. Creating PR for your review."

@Task: git-workflow - "Create PR from [branch] to main with:
  - Comprehensive description
  - Test results
  - Security check results
  - Quality review notes"

PROVIDE: PR link
STATE: "Please review and merge in GitHub when ready."

IF user says "push to main directly":
  RESPOND: "For safety, I've created a PR instead. You can merge it in GitHub."
  STILL create PR
```

## Cache Management Enhancement

### Before Agent OS Commands
```
When user types /create-spec [name]:
  CHECK .claude/docs/internal/patterns/[similar-specs]
  IF found:
    LOAD patterns into context
    Let Agent OS proceed with enhanced context
```

### After Agent OS Commands
```
When Agent OS completes any command:
  EXTRACT new patterns discovered
  SAVE to .claude/docs/internal/patterns/
  UPDATE .claude/metrics/performance.md
```

## Tracking and Metrics

### After Each Session
```
UPDATE .claude/metrics/performance.md:
- Command execution times
- Cache hit rates
- Patterns reused
- Uncertainty points encountered
```

### Pattern Library Growth
```
SAVE successful patterns to:
.claude/docs/internal/patterns/[feature-type].md
```

## Critical Reminders

1. **Uncertainty = STOP**: Never proceed when unsure
2. **Main is Sacred**: Never push directly, always PR
3. **Phases are Strict**: Planning → Approval → Coding → Quality → PR
4. **Cache First**: Always check for existing solutions
5. **Preserve History**: Never delete branches

## Project-Specific Configuration

**Tech Stack**: [Your stack from .agent-os/product/tech-stack.md]
**Standards**: [Your standards from .agent-os/product/]
**Current Sprint**: [Check .agent-os/product/roadmap.md]

---

Remember: When uncertain, STOP and ASK. No fake confidence. Always PR to main.