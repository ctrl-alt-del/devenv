Sherlock and Valid String
=========================
A "valid" string `str` is a string such that for all distinct characters in `str` each such character occurs the same number of times in `str`.

```java
public static String isValidStringForSherlock(String str) {
  final int[] record = new int[26];
  for (char c : str.toCharArray()) {
    record[c % 'a']++;
  }

  int common = -1;
  int alt = -1;
  for (int i : record) {
    if (i <= 0) {
      continue;
    }

    if (common == -1) {
      common = i;
      continue;
    }

    if (alt == -1 && i != common) {
      alt = i;
    }

    if (i != common && i != alt) {
      return "NO";
    }
  }

  if (alt == -1) {
    return "YES";
  }

  int diff = 0;
  for (int i : record) {
    if (i > 0 && i != common) {
      diff += Math.min(i, Math.abs(common - i));
      if (diff > 1) {
        return "NO";
      }
    }
  }
  return "YES";
}
```
