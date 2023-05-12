import Foundation

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    let evenNum = nums.filter { element in element % 2 == 0 }
    let oddNum = nums.filter { element in element % 2 != 0 }

    var result = Array(evenNum)
    result.append(contentsOf: oddNum)
    return result
}

let test1 = [3,1,2,4]
print(sortArrayByParity(test1))
