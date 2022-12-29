import Foundation

func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    Array(arr.joined()).sorted()
}

print(flattenAndSort([[3, 2, 1], [4, 6, 5], [], [9, 7, 8]]))
