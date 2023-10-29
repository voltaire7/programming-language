# λ

Based on: LISP (Scheme), Jai, Uiua, BQN, Haskell and Raku.

## Goals
- Everything is a function.
- Statements written at the top level are executed at compile time; those passed to the compile function are, well, compiled.
- There's a togl function that negates and reassigns and value. Can be used to toggle settings on and of.
- There are only warnings, no errors. They are turned off by default.
- There's a cache setting that you can toggle to avoid compiling again and again.
- You can assign anything to anything.
- You can interact with the compiler.
- You should be able to call CLI app like functions (or just build a shell).
- The language is stack-oriented (not stack-based). In other words, it can use prefix, infix and postfix notation interchanchably.
- It is an array language that uses flat arrays and combinators.
- It is statically but weakly typed.
- It's very similar to LISP but instead of parentheses to isolate code, it uses a diamond character that behaves a bit like . or $ in Haskell. Newlines become said character at compile time.
- There are only two primitives: numbers (arbitrary precision) and characters (strings are lists of characters).
- There are only two complex types: arrays and functions.
- All functions return something (e.g. assignement returns the assigned value).
- Combinators should be one UTF-8 character symbol.
- There's a minimalist 'core' library, and a maximilist 'standard' library.
- The language is very close to how computers actually work, and has very little abstraction.
- Spaced function names are allowed.
- In general, the language is read from left-to-right as a convention. Code should be refactored to follow this rule.
- Ideally, the language is made using only the NAND instruction.

## Examples

### 'Interpreted-Compiled' language
```
echo "This runs at compile time."
cache echo "This runs at compile time, but faster the second time."
compile echo "This compile to an executable."
```

### 'Stacked-oriented' language
```
# Returns true
(+ 1 1) == (1 + 1) == (1 1 +)
```

### Structures
```
node {
    value → 1
    next → ()
}

# The two are equivalent.

node value → 1
node next → ()

# Although the language is also some dynamic since next doesn't
# have to be declare when null.
```

### Isolate function
```
# All true.
+ 1 2 × 3 == 9
+ 1 ⬩ 2 × 3 == 7
+ 1 ( 2 × 3 ) == 7
```

