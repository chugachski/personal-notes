# var, let, const

## Urls
https://dev.to/sarah_chima/var-let-and-const--whats-the-difference-69e

## Scoping
- var
  - global or function scope
  - can be redeclared
  - can be reassigned
  - will be hoisted to the top of the scope (moved to the top and initialized with ```undefined```

- let
  - block scoped - everything withing curly braces
  - can be reassigned
  - cannot be redeclared
  - will be hoisted but will won't be initialized (use before assignment will result in a reference error

- const
  - block scoped
  - cannot be reassigned (will result in assignment to constant error)
  - cannot be redeclared (identifier has already been declared)
  - must be initialized at time of declaration
  - an object assigned with const can still have its properties updated
  - will be hoisted but won't be initialized
