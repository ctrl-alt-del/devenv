Making Anagrams
===============
how many characters need to be remove to make two strings anagrams.
```java
public static int getAnagramRemovalCount(String str1, String str2) {
  int[] arr = new int[26];
  for (char c : str1.toCharArray()) {
    arr[c - 'a'] = arr[c - 'a'] + 1;
  }

  for (char c : str2.toCharArray()) {
    arr[c - 'a'] = arr[c - 'a'] - 1;
  }

  int count = 0;
  for (int i : arr) {
    if (i != 0) {
      count = count + Math.abs(i);
    }
  }
}
```
