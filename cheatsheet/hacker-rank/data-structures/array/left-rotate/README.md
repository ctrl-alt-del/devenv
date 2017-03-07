Left Rotate
===========

```java
public static int[] doLeftRotate(int[] arr, int rotation) {
  if (rotation == 0) {
    return arr;
  }

  int temp = arr[0];
  System.arraycopy(arr, 1, arr, 0, arr.length - 1);
  arr[arr.length - 1] = temp;
  return doLeftRotate(arr, rotation - 1);
}
```
