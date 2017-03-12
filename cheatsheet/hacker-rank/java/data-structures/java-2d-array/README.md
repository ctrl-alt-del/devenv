Java 2D Array
=============
Find Max Hourglass

```java
public static int findMaxHourglasses(int[][] arr) {
    final int n = arr.length - 2;
    int temp;
    int max = Integer.MIN_VALUE;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            temp = arr[i][j] + arr[i][j + 1] + arr[i][j + 2]
                    + arr[i + 1][j + 1]
                    + arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2];
            if (temp > max) {
                max = temp;
            }
        }
    }
    return max;
}
```
