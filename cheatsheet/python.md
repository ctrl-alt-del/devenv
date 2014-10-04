Cheatsheet for Python
=====================

### Syntax
* Duck Typing/ Dynamica Typing
* Significant Space
* Significant Indentation

### Data Type
**Tuple**
<br>
data type only possible with duck typing language.
t = 12, "abc", 34534

**List**
<br>
l = ['abc', 12, "cde"]
list is as close as array as in other language.


**Set**
<br>
it is a list without order and duplicates, and it is extremely good for searching because it is O(1).
you can convert a list to set using casting.

**Dictionary**
<br>
similar to map, key value pair, no order as well.

**Bool**
<br>
True, False
[] is False
['some', 'thing'] is True
0 is False
all other (...,-2,1,1,2,...) is True

**None**
<br>
same as null in Java.



**Multiple Assignment**
<br>
a, b = 0, 1
==> a = 0
==> b = 1

switching variable is as simple as
a, b = b, a


**raw_input**
<br>
raw_input take the user input.

**for loop**
Different conditions used to define the loop:
* for item in list
* for index in range(len(list))
* for index in range(n, m)


for some_condition:
  // do something inside loop
else:
  // execute when the loop is exhausted



**Function**
<br>
def myFunction (arg1, arg2='default2', arg3='default3'):


**Documentation**
<br>
def myFunction():
  ```
  the documentation
  @param
  @type
  @return
  ```

You can also use `epydoc` to create nice looking documentation like java doc


Access the documentation
<br>
myfunction.__doc__
myFunction?  


**List Comprehensions**
<br>
Action to each item on the list, similar to .each in ruby.
[item.strip() for (item in list) if (condtion)]



**Formatted Strings**
<br>
a = 'a'
b = 'b'
c = 'c'
print '%s %s %s' % (a,b,c)

%s string
%e engineering decimal
%f floating point
%g


**File**
r: read
w: write
a: append

f = open(file_dest) // default is read
f = open(file_dest, 'r')
f.read()

f.close()


**pickle Module**
Serialization of data



**Exception Handler**
try:
expect excpetionType:
else:

**Raising Exception**
raise Exception('spam', 'eggs')


**Class**
<br>
class parentClass:
  def __init__(self, arg):


**Inherit other class**
<br>
class newClass(parentClass):
  def __init__(self):
    Animal.__init__(self, ...)

**multiple inheritance**
<br>
class newClass(parentClass1, parentClass2, parentClass3):


**exit(0)**
<br>
everything is fine, exit

**exit(1)**
<br>
something wrong, but can be gracefully exit
