Java Anagrams
=============

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
