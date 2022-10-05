/*
 You get an array of numbers, return the sum of all of the positives ones.
 */

import Foundation

func sumOfPositives (_ numbers: [Int] ) -> Int {
    return numbers.filter { number in number > 0 }.reduce(0, +)
}

print(sumOfPositives([1, -4, 7, 12]))
