String Construction
===================

how much character is needed to construct a given string.
```java
public static int countOccurance(String str) {
  final char[] arr = str.toCharArray();
  final int n = arr.length;
  final int[] record = new int[26];
  int occurance = 0;
  for (char c : arr) {
    if (record[c % 'a'] == 0) {
      record[c % 'a']++;
      occurance++;
      if (occurance >= 26) {
        return occurance;
      }
    }
  }
  return occurance;
}
```
