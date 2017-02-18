Alternating Characters
======================

```java
public static int getAlternatingCharCount(String str) {
  if (str == null || str.length() <= 1) {
    return 0;
  }

  int count = 0;
  char base = str.charAt(0);
  for (char c : str.toCharArray()) {
    if (base != c) {
      base = c;
    } else {
      count++;
    }
  }
  return count > 0 ? count - 1 : count;
}
```
