Diagonal Difference
===================

```java
public static getDiagonalDiff(int[] arr) {
  long fsum = 0;
  long ssum = 0;
  final total = arr.length;
  for(int i = 0; i < total; i = i + n + 1){
    fsum += arr[i];
  }

  for(int i = n-1; i < total - n + 1; i = i + n - 1){
    ssum += arr[i];
  }
  return Math.abs(fsum - ssum);
}
```
