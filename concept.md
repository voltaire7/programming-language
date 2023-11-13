# λ

Based on: LISP (Scheme), Jai, Uiua, BQN, Haskell, Raku, Smalltalk, Io, Red and Forth.

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
- In general, the language is read from left-to-right as a conventtion. Code should be refactored to follow this rule.
- Ideally, the language is made using only the NAND instruction. That or something like flipjump.
- If you can imagine it, you can metaprogram it; you should be able to play doom with macros and stuff

- Okay, new ideas. Not stack oriented.
- It uses infix notation for everything.
- It has letters, words and sentences.
- Letters are basically just UTF-8 characters; I called them letters because 'characters' is too long.
- Words are a series of characters with a definition.
- And sentences are basically a string of characters within a string of characters, denoted by []. They can be treated as code, or just some text. Doesn't matter.
- The language is homoiconic.

## Examples

### 'Interpreted-Compiled' language

[This a comment, but also an unused string.]

[The language is procedural, and therefore, read left-to-right, always.]

[This is how to load a file]
load ./filename

[This is how you execute code. Code is executed when inside []s.]
do [print hello world]

[This is how you define a word]
set word0 expression
set word1 [list of expressions]


