android
=======

* [Network Issues](#network-issues)
  * [`captive_portal_server` is blocked](#captive_portal_server-is-blocked)


# Network Issues
## `captive_portal_server` is blocked
### Behaviors
1. there is a exclamation mark (!) right next to the network icon

2. network won't automatically switch to saved WiFi even when it is available

### Cause
This issue occurs when your network is not able to connect to Google, or Google is walled.


### Solutions
#### For Mac and Linux users
The easiest way to bypass/solve this issue is to use `adb` and set the `captive_portal_server` under `global` manually.

The `<host_name>` needs to be a domain with `/generate_204` sub-domain returning HTTP 204.
```
adb shell "settings put global captive_portal_server <host_name>" # e.g. g.cn, google.cn
```

To determine if a given domain is capable of being a `<host_name>`, utilize `curl` on unix terminal:
```
curl -I http://www.g.cn/generate_204
```

#### For Windows users
You need to have run it on unix-like bash, such as git-bash.

It is capable of being the `<host_name>` if it returns something like this:
```
HTTP/1.1 204 No Content
Content-Length: 0
```

To reset the variable, simply remove the variable by doing:
```
adb shell "settings delete global captive_portal_server"
```
[BACK TO TOP](#android)
