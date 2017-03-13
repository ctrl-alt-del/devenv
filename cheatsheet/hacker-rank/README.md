Hacker Rank
===========

* [Algorithms](#algorithms)
  * [Strings](#strings)
    * [Alternating Characters](#alternating-characters)
    * [Funny String](#funny-string)
    * [Pangram](#pangram)
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



### Find Min Max
```java
public static String findMinMax(long[] arr) {
    long min = Long.MAX_VALUE;
    long max = Long.MIN_VALUE;
    long sum = 0;
    for (long each : arr) {
        if (each >= max) {
            max = each;
        }

        if (each <= min) {
            min = each;
        }
        sum += each;
    }
    return (sum - max) + " " + (sum - min);
}
```
