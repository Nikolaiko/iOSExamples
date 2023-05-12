import Foundation

func thirdMax(_ nums: [Int]) -> Int {
    let newSet = Set(nums)
    let arr = Array(newSet.sorted())

    return arr.count >= 3 ? arr[arr.count - 3] : arr.last!
}

let test1 = [2,2,3,1]
let test2 = [3,2,1]


print(thirdMax(test1))
print(thirdMax(test2))
