import Foundation
import XCTest

func spacify(_ str: String) -> String {
    var arr = Array(str)
    var totalString = ""
    for i in 0..<arr.count {
        totalString += String(arr[i])
        if i < arr.count - 1 {
            totalString += " "
        }
    }
    return totalString
}

print(spacify("hello world"))
print(spacify(""))
print(spacify("123455465"))
