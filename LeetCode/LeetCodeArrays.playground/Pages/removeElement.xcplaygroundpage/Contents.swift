//: [Previous](@previous)

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    let initialCount = nums.count
    nums = nums.filter { element in element != val }.sorted()
    return nums.count
}

var test = [0,1,2,2,3,0,4,2]
let num = 2


print(removeElement(&test, num))

print(test)

