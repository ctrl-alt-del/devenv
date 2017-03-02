Palindrome Index
================
Remove one index to make the given string a palindrome.

```java
public static int findPalindromeBlocker(String str) {
  final char[] arr = str.toCharArray();
  final int n = arr.length;
  final int mid = (n + 1) / 2;
  if (n <= 1) {
    return -1;
  }

  int j;
  char temp;
  for (int i = 0; i < mid; i++) {
    j = n - 1 - i;
    if (arr[i] != arr[j]) {
      temp = arr[i];
      arr[i] = '_';
      if (isPalindrome(new String(arr).replace("_", ""))) {
        return i;
      }

      arr[i] = temp;
      arr[j] = '_';
      if (isPalindrome(new String(arr).replace("_", ""))) {
        return j;
      }
      return -1;
    }
  }
  return -1;
}

public static boolean isPalindrome(String str) {
  final char[] arr = str.toCharArray();
  final int n = arr.length;
  final int mid = (n + 1) / 2;
  if (n <= 1) {
    return false;
  }

  int j;
  for (int i = 0; i < mid; i++) {
    j = n - 1 - i;
    if (arr[i] != arr[j]) {
      return false;
    }
  }
  return true;
}
```
