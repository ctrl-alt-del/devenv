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


### Getters

### Interface names

### MixedCaps


## Semicolons