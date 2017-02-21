Java String Reverse
===================
Also known as the Palindrome problem.

This assumes all inputs are lower cases.
```java
public static boolean isPalindrome (String str) {
    if (str == null || str.isEmpty()) return false;

    if (str.length() == 1) return true;

    int l = str.length();
    int mid = (l + 1) / 2;
    for (int i = 0; i < mid; i++) {
        if (str.charAt(i) != str.charAt(l - i - 1)) return false;
    }
    return true;
}
```
