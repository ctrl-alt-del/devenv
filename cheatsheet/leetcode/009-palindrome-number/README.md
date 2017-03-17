009 Parlindrome Number
======================
Utilize solution from 007
```
public boolean isPalindrome(int x) {
    final boolean negative = x < 0;
    if (negative) {
        return false;
    }
    String s = reverseString(String.valueOf(Math.abs(x)));
    try {
        return Integer.valueOf(s) == x;
    } catch (NumberFormatException ignored) {
        return false;
    }
}

public static String reverseString(String s) {
    char[] arr = s.toCharArray();
    final int len = arr.length;
    char temp;
    for (int i = 0; i < len / 2; i++) {
        temp = arr[i];
        arr[i] = arr[len - 1 - i];
        arr[len - 1 - i] = temp;
    }
    return String.valueOf(arr);
}
```
