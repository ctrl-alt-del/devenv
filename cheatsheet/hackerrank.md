Hacker Rank
===========

* [Algorithms](#algorithms)
  * [Strings](#strings)
    * [Funny String](#funny-string)
    * [Pangrams](#pangrams)
    * [Alternating Characters](#alternating-characters)
    * [Two Strings](#two-strings)
* [Java](#java)
  * [Strings](#strings)
    * [Java String Reverse](#java-string-reverse)


## Algorithms
### Strings
#### Funny String
```java
public static boolean isFunnyString(String str) {
     char[] strArray = str.toCharArray();
     int l = strArray.length;
     if (l == 0) {
         return false;
     }

     if (l == 1 || l == 2) {
         return true;
     }

     int mid = (l + 1)/2;
     for (int i = 1; i <= mid; i++) {
         if (Math.abs(strArray[i] - strArray[i-1]) != Math.abs(strArray[l-i] - strArray[l-i-1])) {
             return false;
         }
     }
     return true;
 }
```



### Pangrams
```java
public static boolean isPangram(String str) {
    int l = str.length();
    if (l < 26) {
        return false;
    }

    boolean[] alphabets = new boolean[26];
    String x = str.toLowerCase();
    int count = 0;
    int index = 0;
    for (int i = 0; i < l; i++) {
        index = x.charAt(i) - 'a';
        if (index >= 0 && !alphabets[index]) {
            alphabets[index] = true;
            count++;
        }

        if (count == 26) {
            return true;
        }
    }
    return false;
}
```



#### Alternating Characters
```java
public static int getAlternatingCharCount(String str) {
    if (str == null || str.length() <= 1) {
        return 0;
    }

    int count = 0;
    char base = str.charAt(0);
    for (char c : str.toCharArray()) {
        if (base != c) {
            base = c;
        } else {
            count++;
        }
    }
    return count > 0 ? count - 1 : count;
}
```



#### Two Strings
The goal is to determine if there is a substring that appears in both give strings.

Since a `char` is the minimum unit of a substring, we just need to know if the two strings share any common characters.
```java
public static boolean hasCommonChar(String str1, String str2) {
    String shorterStr;
    String longerStr;
    if (str1.length() < str2.length()) {
        shorterStr = str1;
        longerStr = str2;
    } else {
        shorterStr = str2;
        longerStr = str1;
    }

    boolean[] strRecord = new boolean[26];
    for (int i = 0; i < shorterStr.length(); i++) {
        strRecord[shorterStr.charAt(i) - 'a'] = true;
    }

    for (int i = 0; i < longerStr.length(); i++) {
        if (strRecord[longerStr.charAt(i) - 'a']) {
            return true;
        }
    }
    return false;
}
```



## Java
### Strings
#### Java String Reverse
Also known as the Palindrome problem.

This assumes all inputs are lower cases.
```java
public static boolean isPalindrome (String str) {
    if (str == null || str.isEmpty()) return false;

    if (str.length() == 1) return true;

    int l = str.length();
    int mid = (l + 1) / 2;
    for (int i = 0; i < mid; i++) {
        if (str.charAt(i) != str.charAt(l - i - 1)) return false;
    }
    return true;
}
```
