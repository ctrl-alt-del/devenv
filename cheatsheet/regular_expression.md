Cheatsheet for Regular Expression
=================================

## Anchors
`^` the start of the string and after each line break
`$` the end of the string and before each line break
`\A` the start of the string
`\Z` the end of the string
`\b` word boundary
`\B` not word boundary
`\<` start of word
`\>` end of word

## Quantifiers
`*` 0 or more
`+` 1 or more
`?` 0 or 1
`{3}` equals exactly 3
`{3,}` equals 3 or more
`{3,5}` equals 3, 4 or 5

## Groups and Ranges
`.` any character except new line (\n)
`(a|b)` a or b
`(...)` group
`(?:...)` passive group
`[abc]` range (a or b or c)
`[^abc]` not a or b or c
`[a-z]` lower case letter from a to z
`[A-Z]` upper case letter from A to Z
`[0-9]` digit from 0 to 9
`\x` group/­sub­pattern number "­x"

## Special Characters
`\n` new line
`\r` return
`\t` tab

## Escape
`\` escape following character
