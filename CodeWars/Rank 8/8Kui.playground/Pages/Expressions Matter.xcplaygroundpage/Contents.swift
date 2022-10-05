/*
 Given three integers a ,b ,c, return the largest number obtained after inserting the following operators and brackets: +, *, ()
 In other words , try every combination of a,b,c with [*+()] , and return the Maximum Obtained (Read the notes for more detail about it)
 */

import Foundation

func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    let allSumm = a + b + c
    let allMultiply = a * b * c
    let firstSum = (a + b) * c
    let secondSum = a * (b + c)

    return max(allSumm, allMultiply, firstSum, secondSum)
}

print(expressionMatter(1, 2, 3))
print(expressionMatter(9, 1, 1))
