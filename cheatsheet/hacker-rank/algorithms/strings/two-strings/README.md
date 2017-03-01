Two Strings
===========

The goal is to determine if there is a substring that appears in both give strings.

Since a `char` is the minimum unit of a substring, we just need to know if the two strings share any common characters.
```java
public static boolean hasCommonChar(String str1, String str2) {
  if (str1 == null || str2 == null) {
    return false;
  }

  String shorterStr;
  String longerStr;
  if (str1.length() < str2.length()) {
    shorterStr = str1;
    longerStr = str2;
  } else {
    shorterStr = str2;
    longerStr = str1;
  }

  boolean[] strRecord = new boolean[26];
  for (int i = 0; i < shorterStr.length(); i++) {
    strRecord[shorterStr.charAt(i) - 'a'] = true;
  }

  for (int i = 0; i < longerStr.length(); i++) {
    if (strRecord[longerStr.charAt(i) - 'a']) {
      return true;
    }
  }
  return false;
}
```
