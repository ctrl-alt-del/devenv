Cheatsheet for JavaScript
=========================

## Syntax
* use semicolon to break statements
* enclose code using `<script></script>` tag
* reference separate file using `<script src="path/to/file.js"></script>`



## Variable
* use `var` to declare a mutable variable
* use `let` to declare a block-scope variable
* use `const` to declare a immutable variable
* use `''` to declare string
* `0`, `''`, undefined, `null` and `false` are read as `false`, otherwise read as `true`

### Name
* must be case-sensitive
* must be unique
* must start with `[a-zA-Z]`, `$` or `_`
* must contain only `[a-zA-Z]`, `[0-9]`, `$` or `_`


### Value
* empty/undefined when created with `var`, always good to initialize the variable
* duck typing
* mutable



## Operations
### Arithmetic
* `-`: opposite
* `+`: sum
* `-`: difference
* `*`: multiplication
* `/`: division
* `%`: modulus


### String
* `+`: concatenation
* `+=`: append


## Logical
* `&&`: and
* `||`: or
* `!`: not


### Boolean
* `==`: equal
* `===`: equal AND same type, a.k.a identical
* `!=`: not equal
* `!==`: not equal OR same type, a.k.a not identical
* `<`: less than
* `>`: greater than
* `<=`: less than OR equal to
* `>`: greater than OR equal to



## Scope
* global: visible everywhere
* local: visible within function
* block: visible within block or expression



## Array
* act as ordered list
* mutable
* allow different type
* counting starts with `0`
* access and assign through `[]`



## Object
* access and assign through `.` or `[]`
