Cheatsheet for Bash
===================

### chmod
chmod changes the permission of a file

**User group** defines what kind of users can do what to a file
* All (a):
* Owner (u):
* Group (g):

**Permission**
* Read (r OR 4): permission to read a file
* Write (w OR 2): permission to write  a file
* Execute (x OR 1): permission to execute a file

**Examples**
* adding `write` permission
`chmod +w <file_path>`

* removing `execute` permission
`chmod -x <file_path>`

* setting permission to specific mode (e.g. 755 or 644)
`chmod 755 <file_path>`
`chmod 644 <file_path>`


### Filesystem
`df` can be used to check size of filesystems
`du` can be used to check size of directory

* `-h`: human readable
* `-c`: grand total value


