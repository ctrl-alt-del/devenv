Android Development Tools (ADT)
===============================
[**Android Development Tools (ADT)**](http://developer.android.com/tools/help/adt.html) is a plugin for android development on eclipse.

Once Eclipse is installed, open it and navigate to its Help -> Install New Software.

On the wizard of Install New Software, click on the add button and paste `https://dl-ssl.google.com/android/eclipse/` to `location` and put `Android Development Toolkit plugin` on `name`, then press OK.

Back to the wizard, click on the drop down list of `Work with`  and select the url item that you just added.

It may take a while for eclipse to get the plugin information, but once the available plugin is displayed, click `Select All` under the displaying section, and then `Next` on the bottom right.  Then follow the instruction to install and plugin and restart Eclipse once the installation is done.

### Empty `src` folder while creating new project
This [issue](http://stackoverflow.com/questions/22215499/src-folder-empty-on-creating-new-android-project) can be resolved by replacing the `http` with `https` on the ADT installation url.

[BACK TO TOP](https://github.com/ctrl-alt-del/devenv)
