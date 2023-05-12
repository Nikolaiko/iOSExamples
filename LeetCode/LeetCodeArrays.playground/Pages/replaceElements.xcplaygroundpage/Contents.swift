import Foundation

func replaceElements(_ arr: [Int]) -> [Int] {
    var maxes = Array(arr.reversed())
    var result: [Int] = []

    for index in 0..<arr.count {
        maxes.popLast()
        result.append(maxes.max() ?? 0)
    }
    print(result)
    result[result.count - 1] = -1
    return result
}

var test1 = [17,18,5,4,6,1]
var test2 = [400]

print(replaceElements(test1))
print(replaceElements(test2))
