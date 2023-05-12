import Foundation

func checkIfExist(_ arr: [Int]) -> Bool {
    var doubleArr: [Int] = []

    for index in 0..<arr.count {
        if doubleArr.contains(arr[index]) {
            return true
        }
        doubleArr.append(arr[index] * 2)
        if arr[index] % 2 == 0 {
            doubleArr.append(arr[index] / 2)
        }
    }
    return false
}

var test1 = [10,2,5,3]
var test2 = [3,1,7,11]
var test3 = [-10,12,-20,-8,15]

print(checkIfExist(test1))
print(checkIfExist(test2))
print(checkIfExist(test3))
