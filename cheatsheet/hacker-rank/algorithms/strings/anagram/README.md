Anagram
=======

```java
public static int getAnagramChangeCount(String str) {
  if (str == null) {
    return false;
  }

  int l = str.length();
  if (l % 2 != 0) {
    return -1;
  }

  int count = 0;
  int[] charCounts = new int[26];
  for (int i = 0; i < l / 2; i++) {
    charCounts[str.charAt(i) - 'a']++;
  }
  for (int i = l / 2; i < l; i++) {
    charCounts[str.charAt(i) - 'a']--;
  }

  for (int i = 0; i < 26; i++) {
    if (charCounts[i] > 0) {
      count = count + charCounts[i];
    }
  }
  return count;
}
```
