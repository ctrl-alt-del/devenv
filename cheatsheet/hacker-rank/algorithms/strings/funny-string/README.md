Funny String
============
```java
public static boolean isFunnyString(String str) {
     if (str == null) {
         return false;
     }

     int l = str.length;
     if (l == 0) {
         return false;
     }

     if (l == 1 || l == 2) {
         return true;
     }

     char[] strArray = str.toCharArray();
     int mid = (l + 1)/2;
     for (int i = 1; i <= mid; i++) {
         if (Math.abs(strArray[i] - strArray[i-1]) != Math.abs(strArray[l-i] - strArray[l-i-1])) {
             return false;
         }
     }
     return true;
 }
```
