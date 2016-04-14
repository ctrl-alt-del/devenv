Cheatsheet for Python
=====================

### Syntax
* Duck Typing a.k.a Dynamic Typing
* Significant Space
* Significant Indentation

### Data Type

#### Tuple
data type only possible with duck typing language.
```python
t = 12, "abc", 34534
```


#### List
List is as close as array as in other language.
```python
l = ['abc', 12, "cde"]
```


#### Set
Set is a list without order and duplicates, and it is extremely good for searching because it is O(1).  You can convert a list to set using casting.


#### Dictionary
Dictionary is similar to map; it is key value pair, no order as well.


#### Bool
Bool includes `True`, `False`, and `None`

* `[]` is `False`
* `['some', 'thing']` is `True`
* `0` is `False`
* all others (...,-2,1,1,2,...) are `True`
* `None` is same as `null` in Java.


### Multiple Assignment
```python
a, b = 0, 1
# ==> a = 0
# ==> b = 1
```

#### Switching Variables
```python
a, b = b, a
# ==> a = 1
# ==> b = 0
```

### raw_input
```python
raw_input("Message to user:") # take the user input while displaying message.
```

### for loop
Different conditions used to define the loop:

Loop through each item on the list:
```python
for item in list:
```

Loop through each item on the list using index:
```python
for index in range(len(list)):
```

Loop through a specific range of items on the list:
```python
for index in range(n, m):
```

```python
for some_condition:
  # do something inside loop
else:
  # execute when the loop is exhausted
```


### Function
```python
def myFunction (arg1, arg2='default2', arg3='default3'):
```

#### Private Method
```python
def __myFunction (arg1, arg2='default2', arg3='default3'):
```


#### Static Method
```python
@staticmethod
def myFunction (arg1, arg2='default2', arg3='default3'):
```



### Documentation
```python
def myFunction():
  ```
  the documentation
  @param
  @type
  @return
  ```
```
You can also use `epydoc` to create nice looking documentation like java doc

#### Access the documentation
```python
myfunction.__doc__
myFunction?
```


### List Comprehensions
Action to each item on the list, similar to .each in ruby.
```python
[item.strip() for (item in list) if (condition)]
```



### Formatted Strings
```python
a = 'a'
b = 'b'
c = 'c'
print '%s %s %s' % (a,b,c)
```
%s string
%e engineering decimal
%f floating point
%g


### File
```python
r: read
w: write
a: append

f = open(file_dest) # default is read
f = open(file_dest, 'r')
f.read()
f.close()
```

### `pickle` Module
Serialization of data



### Exception Handler
```python
try:
  # Some code
expect Error: # e.g. ValueError, TypeError
  # Some handler
else:
  # Other unexpected conditions
```

**Raising Exception**
raise Exception('spam', 'eggs')


### Class
```python
class parentClass:
  def __init__(self, arg):
```

#### Inherit other class
```python
class newClass(parentClass):
  def __init__(self):
    parentClass.__init__(self, ...)
```

#### multiple inheritance
```python
class newClass(parentClass1, parentClass2, parentClass3):
```

### Exit Handling
#### exit(0)
everything is fine, exit

#### exit(1)
something wrong, but can be gracefully exit
