Windows
=======

* [Configure Windows](#configure-windows)
* [Run as Administrator](#run-as-administrator)
* [Environment Variables](#environment-variables)
* [Configure Windows](#configure-windows)


### Configure Windows
It is a good idea to centralize all your packages in one folder.  Not only does it help to better organize your packages, but having a dedicated folder for your packages also makes navigating with command line easier.  

In this instruction for Windows, all packages will be put or installed under `~/Applications`, a.k.a `%USERPROFILE%\Applications`.  Please create the folder if it is not existed, and of course, feel free to name your own directory.

If you are familiar with Window's PowerShell, you can create the folder by opening PowerShell and run:
```sh
cd %USERPROFILE%
mkdir Applications
```
[BACK TO TOP](#windows)


### Run as Administrator
For Windows's default command prompt or PowerShell, you will sometimes need the administrative permission to perform some tasks.  To run as administrator, right click on the `cmd.exe` or `powershell.exe` and select `Run as Administrator` option from the list.

[BACK TO TOP](#windows)


### Environment Variables
For Windows users, it is necessary to modified the Environment Variables (Env) so that some applications can be accessed through [terminal](#terminal).

Follow the steps to reach the interface of Env:
<br>
Right click `My Computer` -> click `Properties` -> click `Environment Variables`

Whenever you want to access a newly installed application through terminal, you can press `New` under the `System variables` section to add the destination of the application as an environment variable.

For `Variable name`, the convention is to use all upper case of the concatenation of application name and `_HOME` (e.g. Python would be `PYTHON_HOME`).

For `Variable value`, just enter the full path of the application.

Once new Env is added, select `Path` row under the `User variables` section, and click the `Edit` button on below.  Go to the end of its `Variable value` and append the name of Env that you just created with a `;` as separator.  Click `OK` and you are done.

Alternatively, you can also use PowerShell script to add and update your Env.

To list all existing Env, open a PowerShell terminal and execute:
```powershell
Get-ChildItem Env:
```
Or you can just list the particular Env by executing: (replacing <variable_name> with the variable name)
```powershell
$Env:<variable_name>
```
[BACK TO TOP](#windows)
