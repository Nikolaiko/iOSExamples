/*
 Complete the square sum function so that it squares each number passed into it and then sums the results together.

 For example, for [1, 2, 2] it should return 9 because 1^2 + 2^2 + 2^2 = 9.
 */

import Darwin

func squareSum(_ vals: [Int]) -> Int {
    var result = 0

    vals.forEach { value in
        result += Int(pow(Double(value), 2))
    }

    return result
}


print(squareSum([1, 2, 3]))
