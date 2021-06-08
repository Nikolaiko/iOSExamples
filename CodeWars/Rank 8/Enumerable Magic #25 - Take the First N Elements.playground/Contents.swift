/*
 Create a function take that takes an Array<Int> and an Int, n, and returns an Array<Int> containing the first up to n elements from the array.
*/

import Foundation

func take(_ arr: [Int], _ n: Int) -> [Int] {
    let index = (n < arr.count) ? n : arr.count
    return Array(arr[0..<index])
}

print(take([0, 1, 2, 3, 5, 8, 13], 3))
