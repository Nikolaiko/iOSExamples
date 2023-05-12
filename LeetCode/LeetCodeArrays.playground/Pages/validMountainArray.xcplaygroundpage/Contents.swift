import Foundation

func validMountainArray(_ arr: [Int]) -> Bool {
    guard arr.count >= 3 else { return false }

    var increaseFlow = true
    var prevValue = Int.min

    for index in 0..<arr.count {
        guard prevValue != arr[index] else { return false }

        if increaseFlow {
            if prevValue > arr[index] {
                if index - 1 > 0 && index - 1 < arr.count - 1 {
                    increaseFlow = false
                } else {
                    print(arr[index])
                    print(prevValue)
                    print("Wrong position: \(index)")
                    return false
                }
            }
        } else if increaseFlow == false {
            if prevValue < arr[index] {
                print(arr)
                print("Wrong flow: \(prevValue) : \(arr[index])")
                return false
            }
        }
        prevValue = arr[index]
    }
    return !increaseFlow
}

var test1 = [2,1]
var test2 = [3,5,5]
var test3 = [0,3,2,1]
var test4 = [1,3,2]

print(validMountainArray(test1))
print(validMountainArray(test2))
print(validMountainArray(test3))
print(validMountainArray(test4))
