/*
 Definition
 Extra perfect number is the number that first and last bits are set bits.

 Task
 Given a positive integer N , Return the extra perfect numbers in range from 1 to N .
 */

import Foundation

func extraPerfect(_ n: Int) -> [Int] {
    (1...n).filter {
        let s = String($0, radix: 2)
        return s.first == "1" && s.last == "1"
    }
}


print(extraPerfect(5))
