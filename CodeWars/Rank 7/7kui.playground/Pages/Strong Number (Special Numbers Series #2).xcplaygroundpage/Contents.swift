/*
 Strong number is the number that the sum of the factorial of its digits is equal to number itself.

 For example, 145 is strong, since 1! + 4! + 5! = 1 + 24 + 120 = 145.

 Task
 Given a number, Find if it is Strong or not and return either "STRONG!!!!" or "Not Strong !!".
 */

import UIKit

func strongNumber(_ number: Int) -> String {
    let stringNumber = String(number)
    var factSum = 0

    stringNumber.forEach { digit in
        let singleDigit = String(digit)
        factSum += factorialValue(fNumber: Int(singleDigit)!)
    }
    return factSum == number ? "STRONG!!!!" : "Not Strong !!"
}

func factorialValue(fNumber: Int) -> Int{
   if fNumber == 0{
      return 1
   } else {
      return fNumber * factorialValue(fNumber:fNumber-1)
   }
}

print(strongNumber(145))
print(strongNumber(143))
