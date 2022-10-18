/*
 Count the number of divisors of a positive integer n.

 Random tests go up to n = 500000.

 Examples (input --> output)
 4 --> 3 (1, 2, 4)
 5 --> 2 (1, 5)
 12 --> 6 (1, 2, 3, 4, 6, 12)
 30 --> 8 (1, 2, 3, 5, 6, 10, 15, 30)
 Note you should only return a number, the count of divisors. The numbers between parentheses are shown only for you to see which numbers are counted in each case.
 */

import Foundation

func divisors(_ n: UInt32) -> UInt32 {
    var divisors: UInt32 = 0

    for index in 1...n {
        if n % index == 0 {
            divisors += 1
        }
    }
    return divisors
}

print(divisors(4))
print(divisors(5))
print(divisors(12))
