Cheatsheet for Go
=================

This cheatsheet is based on the official document, [Effective Go](https://golang.org/doc/effective_go.html).


## Formatting
0. `gofmt` and `go fmt` are used to format the go code
0. `gofmt` operates in file level and `go fmt` operates in package level
0. Go, the programming language uses indentation instead of spaces
0. there is no line limit
0. Go doesn't require parentheses in control structures, such as if, for, switch



## Commentary
0. block comments used for package comment, line comment is the norm
0. add package comment to each package before the `package` clause
0. `godoc` formats comments
0. comments are uninterpreted plain text,
0. avoid HTML or other annotations (e.g. `_this_`); they won't reproduce verbatim
0. every exported (capitalized) name/method should have a doc comment
0. start the doc comment with the name/method so that it can be grep easily if needed



## Names

### Package names
0. names have semantic effect
0. package names use single-word, lower case and should be short, concise, and evocative
0. don't worry collisions,  package name is only the default name for imports
0. only upper case names are visible outside of its package
0. package name is the base name of its source directory
0. constructor can be either `New` or `New` append with the exported name


### Getters and Setters
0. getter should be the upper cased field name, e.g. `Name()` for field `name`
0. setter should be `Set` append with the upper cased field name, e.g. `SetName()` for field `name`


### Interface names
0. one-method interfaces are named by the method name plus an -er suffix or similar modification to construct an agent noun: `Reader`, `Writer`, `Formatter`, `CloseNotifier` etc
0. avoid using names that have canonical signatures and meanings, unless it has the same signature and meaning, e.g. `Read`, `Write`, `Close`, `Flush`, `String`


### MixedCaps
0. use Capitialized Camel Case `MixedCaps` or Camel Case `mixedCaps` to write multiword names.




## Semicolons
0. use semicolons to terminate a statement, but it is not required on Go in most of the time since it will be automatically inserted

### Rules
0. the last token before a newline is an identifier (which includes words like `int` and `float64`), a basic literal such as a number or string constant, or one of the tokens
0. if the newline comes after a token that could end a statement, insert a semicolon
0. don't put the opening brace of a control structure, e.g. `if`, `for`, `switch`, or `select`) on the next line



## Control structures
0. there is no `do` or `while` loop

### If
0. avoid unnecessary `else` as much as possible, a.k.a stop the flow early using conditions


### Redeclaration and reassignment
0. value are mutable


### For
0. C `for`: `for init; condition; post { }`
0. C `while`: `for condition { }`
0. C `for(;;)`: `for { }`
0. use an underscore (`_`), blank identifier to discard the unwanted value

### Switch


### Type switch

