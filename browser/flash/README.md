Flash
=====

[Flash Issue on Older PC](#flash-issue-on-older-pc)

## Flash Issue on Older PC
### Cause
Newer Flash (version 11 and after) requires the `SSE2` feature, which was first introduced by Intel on its Pentium 4 CPUs.  However, AMD and other manufacturers include such feature only on their 64-bit CPUs.  Therefore, older computers with Pentium 3 or AMD 32-bit CPUs won't be supported by the newer version of Flash.

### Solution
1. ~~Use the [Chromium](https://www.chromium.org)~~ [Newer version of Chromium stops supporting CPUs without `SSE2`, so the only option left is to install older version of Flash]
1. Install the Flash 10 plugins, but it is lack of the latest security supports, and thus could be harmful.
