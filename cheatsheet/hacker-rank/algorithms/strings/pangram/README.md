Pangram
=======

```java
public static boolean isPangram(String str) {
  if (str == null) {
    return false;
  }

  int l = str.length();
  if (l < 26) {
    return false;
  }

  boolean[] alphabets = new boolean[26];
  String x = str.toLowerCase();
  int count = 0;
  int index = 0;
  for (int i = 0; i < l; i++) {
    index = x.charAt(i) - 'a';
    if (index >= 0 && !alphabets[index]) {
      alphabets[index] = true;
      count++;
    }

    if (count == 26) {
      return true;
    }
  }
  return false;
}
```
