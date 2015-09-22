Cheatsheet for Go
=================

This cheatsheet is based on the official document, [Effective Go](https://golang.org/doc/effective_go.html).


## Formatting
*. `gofmt` and `go fmt` are used to format the go code
*. `gofmt` operates in file level and `go fmt` operates in package level
*. Go, the programming language uses indentation instead of spaces
*. there is no line limit
*. Go doesn't require parentheses in control structures, such as if, for, switch



## Commentary
*. block comments used for package comment, line comment is the norm
*. add package comment to each package before the `package` clause
*. `godoc` formats comments
*. comments are uninterpreted plain text,
*. avoid HTML or other annotations (e.g. `_this_`); they won't reproduce verbatim
*. every exported (capitalized) name/method should have a doc comment
*. start the doc comment with the name/method so that it can be grep easily if needed



## Names

### Package names

### Getters

### Interface names

### MixedCaps


## Semicolons