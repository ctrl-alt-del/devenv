Mars Exploration
================
Count Modified SOS Message

```java
public static int getModifiedCount(String str) {
  final char[] arr = str.toCharArray();
  int count = 0;
  for (int i = 0; i < arr.length; i = i + 3) {
    if (arr[i] != 'S') {
      count++;
    }
  }

  for (int i = 1; i < arr.length; i = i + 3) {
    if (arr[i] != 'O') {
      count++;
    }
  }

  for (int i = 2; i < arr.length; i = i + 3) {
    if (arr[i] != 'S') {
      count++;
    }
  }
  return count;
}
```
