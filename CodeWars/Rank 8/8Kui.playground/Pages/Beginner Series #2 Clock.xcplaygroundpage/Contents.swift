//: [Previous](@previous)
/*
 Clock shows h hours, m minutes and s seconds after midnight.

 Your task is to write a function which returns the time since midnight in milliseconds.

 Example:
 h = 0
 m = 1
 s = 1

 result = 61000
 */


import Foundation

func past(_ h: Int, _ m: Int, _ s: Int) -> Int {
    let secondsInHour = 3600
        let secondsInMinute = 60
        let milisecondsInSecond = 1000

        return (h * secondsInHour + m * secondsInMinute + s) * milisecondsInSecond
}

print(past(4, 3, 23))

//: [Next](@next)
