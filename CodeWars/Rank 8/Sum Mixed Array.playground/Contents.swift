/*
 Given an array of integers as strings and numbers, return the sum of the array values as if all were numbers.

 Return your answer as a number.
 */

import Foundation

func sumMix(_ arr: [Any]) -> Int {
    arr.reduce(0) { prevSum, element -> Int in
        prevSum + (element is String ? Int(element as! String)! : element as! Int)
    }
}


print(sumMix([9, 3, "7", "3"]))
