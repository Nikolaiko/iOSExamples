import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    let helperSet = Set<Int>(nums)
    nums = Array<Int>(helperSet).sorted()

    return nums.count
}

