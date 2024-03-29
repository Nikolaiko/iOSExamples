import Foundation


/*
 Complete the function so that it finds the average of the three scores passed to it and returns the letter value associated with that grade.

 Numerical Score    Letter Grade
 90 <= score <= 100    'A'
 80 <= score < 90    'B'
 70 <= score < 80    'C'
 60 <= score < 70    'D'
 0 <= score < 60    'F'
 Tested values are all between 0 and 100. Theres is no need to check for negative values or values greater than 100.
 */

func getGrade(_ s1: Int, _ s2: Int, _ s3: Int) -> String {
    let dd: [Int] = []

    
    let score = (s1 + s2 + s3) / 3
    if score >= 90 {
        return "A"
    } else if score >= 80 {
        return "B"
    } else if score >= 70 {
        return "C"
    } else if score >= 60 {
        return "D"
    } else {
        return "F"
    }
}

print(getGrade(100,85,96))
print(getGrade(82,85,87))
print(getGrade(58,59,60))



