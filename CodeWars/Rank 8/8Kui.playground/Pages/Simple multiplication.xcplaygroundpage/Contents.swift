/*
 This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.
 */

import Foundation

func simpleMultiplication(_ num: Int) -> Int {
    num % 2 == 0 ? num * 8 : num * 9
}



print(simpleMultiplication(8))
print(simpleMultiplication(5))
print(simpleMultiplication(21))
