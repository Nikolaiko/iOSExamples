import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var readIndex = -1

    for index in 0..<nums.count {
        guard nums[index] == 0 else { continue }
        print(index)
        for searchIndex in index + 1..<nums.count {
            guard nums[searchIndex] != 0 else { continue }
            readIndex = searchIndex
            break
        }
        print(readIndex)
        if readIndex != -1 {
            nums[index] = nums[readIndex]
            nums[readIndex] = 0
            readIndex = -1
        } else {
            break
        }
    }
}

var test1 = [0,1,0,3,12]
var test2 = [0]

moveZeroes(&test1)
moveZeroes(&test2)
