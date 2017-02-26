Caesar Cipher
=============

```java
public static char getCaesarChar(char letter, int offset) {
  offset = offset % 26;
  char c = Character.toLowerCase(letter);
  if (c < 'a' || c > 'z') {
    return c;
  }

  if (offset < 0) {
    return getCaesarChar(letter, 26 + offset);
  }

  int next = c + offset;
  final char result;
  if (next > 'z') {
    result = (char) ('a' + next % 'z' - 1);
  } else {
    result = (char) next;
  }
  return c == letter ? result : Character.toUpperCase(result);
}
```
