//: [Previous](@previous)

import Foundation

func findNumbers(_ nums: [Int]) -> Int {
    nums.filter { element in String(element).count % 2 == 0 }.count
}
