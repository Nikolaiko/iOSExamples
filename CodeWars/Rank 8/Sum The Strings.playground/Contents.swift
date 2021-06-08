/*
 Create a function that takes 2 nonnegative integers in form of a string as an input, and outputs the sum (also as a string):

 Example: (Input1, Input2 -->Output)

 "4",  "5" --> "9"
 "34", "5" --> "39"
 */

import Foundation

func sum_str(_ a:String, _ b:String) -> String {
    return String((Int(a) ?? 0) + (Int(b) ?? 0))
}

print(sum_str("4", "5"))
