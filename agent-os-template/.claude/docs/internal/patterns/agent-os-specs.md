# Cached Agent OS Spec Patterns

## Authentication Spec Pattern
From successful `/create-spec authentication`:
```markdown
## User Stories
As a user, I want secure login so I can access my account.

## Spec Scope
1. **Login/Signup Forms** - Email/password validation
2. **JWT Sessions** - HttpOnly cookies, 24h expiry
3. **Password Reset** - Email verification flow
4. **CSRF Protection** - Token validation

## Technical Requirements
- Bcrypt for password hashing (cost: 10)
- JWT with refresh tokens
- Rate limiting: 5 attempts per minute
```

## CRUD Spec Pattern  
From successful `/create-spec crud-operations`:
```markdown
## Standard CRUD Operations
1. **CREATE** - POST /api/resource
2. **READ** - GET /api/resource/:id
3. **UPDATE** - PATCH /api/resource/:id
4. **DELETE** - DELETE /api/resource/:id
5. **LIST** - GET /api/resource?page=1&limit=10

## Validation Requirements
- Input sanitization
- Type checking with Zod
- Business rule validation
```

## Database Migration Pattern
From successful `/create-spec database-changes`:
```sql
-- Agent OS migration pattern
BEGIN;

-- Create new structure
CREATE TABLE new_table (...);

-- Migrate data
INSERT INTO new_table SELECT * FROM old_table;

-- Swap tables
ALTER TABLE old_table RENAME TO old_table_backup;
ALTER TABLE new_table RENAME TO old_table;

COMMIT;
```

## Component Spec Pattern
From successful `/create-spec ui-component`:
```markdown
## Component Structure
- Container component for logic
- Presentational component for UI  
- Separate types file
- Comprehensive tests
- Storybook story

## Accessibility Requirements
- ARIA labels
- Keyboard navigation
- Screen reader support
- Color contrast compliance
```

[Cache patterns from each successful Agent OS spec]