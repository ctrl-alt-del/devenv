007 Reverse Integer
===================
Utilize solution from 344
```
public static int reverse(int x) {
    final boolean negative = x < 0;
    String s = reverseString(String.valueOf(Math.abs(x)));
    try {
        final int result = Integer.valueOf(s);
        if (negative) {
            return 0 - result;
        }
        return result;
    } catch (NumberFormatException ignored) {
        return 0;
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
