Compare Triplets
================

```java
public static String compareTriplets(int[] a, int[] b) {
  long ac = 0;
  long bc = 0;
  int n = a.length;
  for (int i = 0; i < n; i++) {
    if (a[i] > b[i]) {
      ac++;
    } else if (a[i] < b[i]) {
      bc++;
    }
  }
  return ac + " " + bc;
}
```
