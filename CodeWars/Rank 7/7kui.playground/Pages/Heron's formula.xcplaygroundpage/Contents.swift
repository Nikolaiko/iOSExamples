/*
 DESCRIPTION:
 Write function heron which calculates the area of a triangle with sides a, b, and c (x, y, z in COBOL).

 Heron's formula:

 s∗(s−a)∗(s−b)∗(s−c)\sqrt{s * (s - a) * (s - b) * (s - c)}
 s∗(s−a)∗(s−b)∗(s−c)


 where

 s=(a+b+c) / 2


 Output should have 2 digits precision.
 */

import Foundation

func heron(_ a: Double, _ b: Double, _ c: Double) -> Double {
    let s: Double = (a + b + c) / 2.0
    let result: Double = sqrt(s * (s - a) * (s - b) * (s - c))
    return (result * 100).rounded() / 100
}

print(heron(4, 6, 9))
