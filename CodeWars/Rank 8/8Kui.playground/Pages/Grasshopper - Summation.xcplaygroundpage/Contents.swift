import Foundation

/*
 Write a program that finds the summation of every number from 1 to num. The number will always be a positive integer greater than 0.
 */

func summation(_ n: Int) -> Int {
    var sum = 0
    for i in 1...n {
        sum += i
    }
    return sum
}


print(summation(8))
print(summation(22))
