import Foundation

func mergeArrays(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1.removeLast(n)
    for currentIndex in 0..<n {
        let insertIndex = nums1.lastIndex { element in element < nums2[currentIndex] }
        if insertIndex != nil {
            nums1.insert(nums2[currentIndex], at: insertIndex! + 1)
        } else {
            nums1.insert(nums2[currentIndex], at: 0)
        }
    }
}

var test1 = [1,2,3,0,0,0]
var test2 = [2,5,6]

mergeArrays(&test1, 3, test2, 3)

print(test1)

