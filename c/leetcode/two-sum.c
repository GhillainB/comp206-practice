#include <stdio.h>
#include <stdlib.h>

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
 // Allocate memory for the 2 indices to be returned
   
    int* result = (int*)malloc(2 * sizeof(int));
    *returnSize = 2;
    
 // Brute force approach: check every possible pair
    for (int i = 0; i < numsSize; i++) {
        for (int j = i + 1; j < numsSize; j++) {
            if (nums[i] + nums[j] == target) {
                result[0] = i;
                result[1] = j;
                return result;
            }
        }
    }
    
    *returnSize = 0;
    return NULL; // Should not reach here per problem constraints (one solution guaranteed)
}

int main() {
    // Test case setup
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;
    
    // Call the twoSum function
    int* indices = twoSum(nums, numsSize, target, &returnSize);
    
    // Print the results
    if (indices != NULL && returnSize == 2) {
        printf("Indices found: [%d, %d]\n", indices[0], indices[1]);
        // Free the allocated memory returned by the function
        free(indices);
    } else {
        printf("No solution found.\n");
    }
    
    return 0;
}



