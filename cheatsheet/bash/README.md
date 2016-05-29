Cheatsheet for Bash
===================

### `chmod`
`chmod` is a command line interface that changes the permission of a file

#### User Group
It defines user privilege on a file
* All (a):
* Owner (u):
* Group (g):

#### Permission
* Read (r OR 4): permission to read a file
* Write (w OR 2): permission to write  a file
* Execute (x OR 1): permission to execute a file

**Examples**
<br>
Note that you may need `sudo` permission to perform the following tasks.
* Adding `write` permission: `chmod +w <file_path>`
* Removing `execute` permission: `chmod -x <file_path>`
* Changing permission to a specific value (e.g. 755 or 644): `chmod 755 <file_path>` or `chmod 644 <file_path>`


### Filesystem
`df` can be used to check size of filesystems
`du` can be used to check size of directory

* `-h`: human readable
* `-c`: grand total value
