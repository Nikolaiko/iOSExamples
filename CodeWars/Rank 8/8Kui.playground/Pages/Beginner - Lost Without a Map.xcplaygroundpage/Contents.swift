/*
 Given an array of integers, return a new array with each value doubled.
 */

import Foundation

func maps(a : Array<Int>) -> Array<Int> {
    a.map { number in number * 2 }
}

print(maps(a: [1, 2, 3]))
