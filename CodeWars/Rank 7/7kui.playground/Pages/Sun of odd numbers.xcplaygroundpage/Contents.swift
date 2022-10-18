/*
 Given the triangle of consecutive odd numbers:

              1
           3     5
        7     9    11
    13    15    17    19
 21    23    25    27    29
 ...
 Calculate the sum of the numbers in the nth row of this triangle (starting at index 1) e.g.: (Input --> Output)

 1 -->  1
 2 --> 3 + 5 = 8
 */

import Foundation

func rowSumOddNumbers(_ row: Int) -> Int {
    let totalNumbers = Array(1..<row).reduce(0, +)
    var currentNumber = 1 + (2 * totalNumbers)

    var summ = 0
    for i in 0..<row {
        summ += currentNumber
        currentNumber += 2
    }
    return summ
}

print(rowSumOddNumbers(1))
print(rowSumOddNumbers(2))
