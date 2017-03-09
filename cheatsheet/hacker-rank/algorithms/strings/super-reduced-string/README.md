Super Reduced String
====================

```java
public static String reduceString(String str) {
  char[] arr = str.toCharArray();
  int n = arr.length - 1;
  for (int i = 0; i < n; i++) {
    if (arr[i] == arr[i + 1]) {
      arr[i] = '_';
      arr[i + 1] = '_';
      return reduceString(new String(arr).replace("_", ""));
    }
  }
  return str.length() > 0 ? str : "Empty String";
}
```
