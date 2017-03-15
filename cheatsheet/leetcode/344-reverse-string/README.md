344 Reverse String
==================
```
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
