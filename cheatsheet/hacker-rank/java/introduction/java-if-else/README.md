Java If-Else
============

```java
public static String getWireCondition(int n) {
  if (n % 2 != 0) {
    return "Weird";
  }

  if (n >= 2 && n <= 5 && n % 2 == 0) {
    return "Not Weird";
  }

  if (n >= 6 && n <= 20 && n % 2 == 0) {
    return "Weird";
  }
  return "Not Weird";
}
```
