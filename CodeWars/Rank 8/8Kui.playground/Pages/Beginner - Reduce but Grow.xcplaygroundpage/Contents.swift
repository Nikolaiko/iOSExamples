import Foundation

func grow(_ arr: [Int]) -> Int {
    return arr.reduce(1) { first, second in
        first * second
    }
}

print(grow([1,2,3]))
print(grow([4,1,1,1,4]))
print(grow([2,2,2,2,2,2]))
