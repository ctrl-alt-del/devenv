Hacker Rank
===========

* [Algorithms](#algorithms)
  * [Strings](#strings)
    * [Funny String](#funny-string)
    * [Pangram](#pangram)
    * [Alternating Characters](#alternating-characters)
    * [Anagram](#anagram)
    * [Two Strings](#two-strings)
* [Java](#java)
  * [Strings](#strings)
    * [Java String Reverse](#java-string-reverse)
    * [Java Anagrams](#java-anagrams)
    * [Java String Compare](#java-string-compare)
* [Others](#others)
  * [Phone Number to Strings](#phone-number-to-strings)
  * [Find All Capitalized Letter Combinations](#find-all-capitalized-letter-combinations)




## Algorithms
### Strings
#### Funny String
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



#### Pangram
```java
public static boolean isPangram(String str) {
    if (str == null) {
        return false;
    }

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



#### Anagram
```java
public static int getAnagramChangeCount(String str) {
    if (str == null) {
        return false;
    }

    int l = str.length();
    if (l % 2 != 0) {
        return -1;
    }

    int count = 0;
    int[] charCounts = new int[26];
    for (int i = 0; i < l / 2; i++) {
        charCounts[str.charAt(i) - 'a']++;
    }
    for (int i = l / 2; i < l; i++) {
        charCounts[str.charAt(i) - 'a']--;
    }

    for (int i = 0; i < 26; i++) {
        if (charCounts[i] > 0) {
            count = count + charCounts[i];
        }
    }
    return count;
}
```



#### Two Strings
The goal is to determine if there is a substring that appears in both give strings.

Since a `char` is the minimum unit of a substring, we just need to know if the two strings share any common characters.
```java
public static boolean hasCommonChar(String str1, String str2) {
    if (str1 == null || str2 == null) {
        return false;
    }

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



#### Java Anagrams
```java
public static boolean isAnagram(String str1, String str2) {
    if (str1 == null || str2 == null || str1.length() != str2.length()) {
        return false;
    }

    str1 = str1.toLowerCase();
    str2 = str2.toLowerCase();

    int[] strRecord = new int[26];
    for (int i = 0; i < str1.length(); i++) {
        strRecord[str1.charAt(i) - 'a']++;
    }

    for (int i = 0; i < str2.length(); i++) {
        strRecord[str2.charAt(i) - 'a']--;

        if (strRecord[str2.charAt(i) - 'a'] < 0) {
            return false;
        }
    }

    for (int each : strRecord) {
        if (each != 0) {
            return false;
        }
    }
    return true;
}
```



#### Java String Compare
```java
public static List<String> getSubstrings(String str, int k) {
    if (str == null || str.length() < k) return Collections.emptyList();

    List<String> results = new ArrayList<>(str.length() - k);
    for (int i = 0; i < str.length() - k + 1; i++) {
        results.add(str.substring(i, i + k));
    }
    return results;
}

public static void findMinMaxLexiString(List<String> strs) {
    String minLexiString = strs.get(0);
    String maxLexiString = strs.get(0);
    for (int i = 1; i < strs.size(); i++) {
        if (!isLexiSmaller(minLexiString, strs.get(i))) {
            minLexiString = strs.get(i);
        }

        if (!isLexiSmaller(strs.get(i), maxLexiString)) {
            maxLexiString = strs.get(i);
        }
    }
    System.out.println(minLexiString);
    System.out.println(maxLexiString);
}

public static boolean isLexiSmaller(String str1, String str2) {
    final int len = str1.length() < str2.length() ? str1.length() : str2.length();
    for (int i = 0; i < len; i++) {
        if (str1.charAt(i) < str2.charAt(i)) {
            return true;
        } else if (str1.charAt(i) > str2.charAt(i)) {
            return false;
        }
    }
    return false;
}
```



## Others
### Phone Number to Strings
```java
public static void main(String[] args) {
    HashMap<String, String> mPool = new HashMap<>();
    mPool.put("0", "");
    mPool.put("1", "");
    mPool.put("2", "abc");
    mPool.put("3", "def");
    mPool.put("4", "ghi");
    mPool.put("5", "jkl");
    mPool.put("6", "mno");
    mPool.put("7", "pqrs");
    mPool.put("8", "tuv");
    mPool.put("9", "wxyz");
    String phoneNumber = "123456789";
    List<String> combinations = toStringsVer1(phoneNumber, mPool);
    for (String opt : combinations) {
        System.out.println(opt);
    }
}

public static List<String> toStringsVer1(String str, HashMap<String, String> mPool) {
    if (str.length() == 0) return Collections.emptyList();

    List<String> results = new ArrayList<>();
    String digit2String = mPool.get(str.substring(0, 1));
    digit2String = digit2String.length() == 0 ? " " : digit2String;
    char[] currentDigitChars = digit2String.toCharArray();
    if (str.length() == 1) {
        for (char ch : currentDigitChars) {
            results.add(String.valueOf(ch));
        }
    } else {
        String nextStr = str.substring(1);
        List<String> suffixes = getNumber2Strings(nextStr, mPool);
        for (char ch : currentDigitChars) {
            for (String suffix : suffixes) {
                results.add(ch + suffix);
            }
        }
    }
    return results;
}
```

Alternative
```java
public static List<String> toStringsVer2(char[] arr, int position, Map<Character, String> map) {
    List<String> list = new ArrayList<>();
    if (position > arr.length - 1) {
        return Collections.emptyList();
    }

    final char[] letters = map.get(arr[position]).toCharArray();
    if (position == arr.length - 1) {
        for (char c : letters) {
            list.add(c + "");
        }
        return list;
    }

    for (char c : letters) {
        for (String tail : toStringsVer2(arr, position + 1, map)) {
            list.add(c + tail);
        }
    }
    return list;
}
```



### Find All Capitalized Letter Combinations
```java
public static void main(String[] args) {
  unveilCode("abc".toCharArray(), 0);
}

public static void unveilCode(char[] chars, int n) {
    int l = chars.length;
    char lastChar = chars[l - 1];
    if (Character.toUpperCase(lastChar) == lastChar) {
        return;
    }

    char tempChar;
    for (int i = n; i < l; i++) {
        tempChar = chars[i];

        chars[i] = Character.toUpperCase(chars[i]);
        System.out.println(chars);
        unveilCode(chars, i + 1);

        chars[i] = tempChar;
    }
}
```


### Diagonal Difference
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



### Staircase
```java
public static void createStaircase(int n) {
    char[] arr = new char[n];
    for (int i = 0; i < n; i++) {
        arr[i] = ' ';
    }

    for (int i = n - 1; i >= 0; i--) {
        arr[i] = '#';
        System.out.println(new String(arr));
    }
}
```

### Count Modified SOS Message
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


### Making Anagrams
how many characters need to be remove to make two strings anagrams.
```java
public static int getAnagramRemovalCount(String str) {
  int[] arr = new int[26];
  for (char c : str1.toCharArray()) {
      arr[c - 'a'] = arr[c - 'a'] + 1;
  }

  for (char c : str2.toCharArray()) {
      arr[c - 'a'] = arr[c - 'a'] - 1;
  }

  int count = 0;
  for (int i : arr) {
      if (i != 0) {
          count = count + Math.abs(i);
      }
  }
}
```


### Find Max Hourglass
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


### Left Rotate
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



### Wired Condition
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
