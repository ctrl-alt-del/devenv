Two Characters
==============

```java
public static List<Character> getDistinctCharacters(String str) {
  final List<Character> list = new ArrayList<>(str.length());
  for (char c : str.toCharArray()) {
    if (!list.contains(c)) {
      list.add(c);
    }
  }
  return list;
}

public static List<String> removeCharacter(String str, List<Character> letters) {
  final List<String> list = new ArrayList<>();
  if (str.length() < 2) {
    return list;
  }

  if (isAlt(str)) {
    list.add(str);
    return list;
  }


  for (char l : letters) {
    if (str.contains(Character.toString(l))) {
      list.addAll(removeCharacter(str.replace(Character.toString(l), ""), letters));
    }
  }
  return list;
}

public static boolean isAlt(String str) {
  final int n = str.length();
  if (n < 2) {
    return false;
  }

  char x = str.charAt(0);
  char y = str.charAt(1);
  if (x == y) {
    return false;
  }

  for (int i = 0; i < n; i++) {
    if (i % 2 == 0) {
      if (str.charAt(i) != x) {
        return false;
      }
    } else {
      if (str.charAt(i) != y) {
        return false;
      }
    }
  }
  return true;
}
```
