import UIKit

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var max = Int.min
    var result: Int = 0
    nums.forEach { current in
        if current == 1 {
            result += 1
        } else {
            if result > max {
                max = result
            }
            result = 0
        }
    }
    if result > max {
        max = result
    }
    return max
}

print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
