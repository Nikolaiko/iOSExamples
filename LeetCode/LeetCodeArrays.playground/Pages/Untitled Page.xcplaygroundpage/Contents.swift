

import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    nums.map { element in element * element }.sorted()
}
