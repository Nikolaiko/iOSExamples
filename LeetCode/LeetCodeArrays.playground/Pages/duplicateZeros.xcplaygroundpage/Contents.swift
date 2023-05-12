import Foundation

func duplicateZeros(_ arr: inout [Int]) {
    var result: [Int] = []
    var index = 0
    var newCount = 0

    while newCount < arr.count {
        result.append(arr[index])
        if arr[index] == 0 && newCount + 1 < arr.count {
            newCount += 1
            result.append(arr[index])
        }
        index += 1
        newCount += 1
    }
    arr = result
}

var temp = [1,0,2,3,0,4,5,0]

duplicateZeros(&temp)
