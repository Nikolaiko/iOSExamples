import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var temp = Set(1...nums.count)
    nums.forEach { element in temp.remove(element) }
    return Array(temp)
}

let test1 = [4,3,2,7,8,2,3,1]
let test2 = [1, 1]

print(findDisappearedNumbers(test1))
print(findDisappearedNumbers(test2))
