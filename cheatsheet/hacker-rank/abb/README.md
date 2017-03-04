ABB
===

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
