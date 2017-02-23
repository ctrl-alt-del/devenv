Java String Compare
===================

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
