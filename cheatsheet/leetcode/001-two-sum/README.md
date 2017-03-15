001 Two Sum
===========
```
public static int[] twoSum(int[] nums, int target) {
    final int len = nums.length;
    int next;
    for (int i = 0; i < len; i++) {
        next = findNext(nums, len, target - nums[i], i + 1);
        if (next > i) {
            return new int[]{i, next};
        }
    }
    return new int[]{-1, -1};
}

public static int findNext(int[] nums, int len, int target, int start) {
    for (int i = start; i < len; i++) {
        if (target == nums[i]) {
            return i;
        }
    }
    return -1;
}
```