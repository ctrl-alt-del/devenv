Game of Thrones
===============
Find if a string is an anagram of a certain palindrome string.

```java
public static String GoT1(String str) {
    final char[] arr = str.toCharArray();
    final int n = arr.length;
    final int[] record = new int[26];

    for (char c : arr) {
        record[c % 'a']++;
    }

    boolean hasCenter = false;
    for (int c : record) {
        if (c % 2 != 0) {
            if (!hasCenter) {
                hasCenter = true;
            } else {
                return "NO";
            }
        }
    }
    return "YES";
}
```
