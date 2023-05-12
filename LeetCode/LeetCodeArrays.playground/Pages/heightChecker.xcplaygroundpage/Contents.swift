import Foundation

func heightChecker(_ heights: [Int]) -> Int {
    var difference = 0
    let expected = heights.sorted()
    for index in 0..<expected.count {
        if expected[index] != heights[index] {
            difference += 1
        }
    }
    return difference
}

let test1 = [1,2,3,4,5]
let test2 = [1,1,4,2,1,3]
let test3 = [5,1,2,3,4]

print(heightChecker(test1))
print(heightChecker(test2))
print(heightChecker(test3))

