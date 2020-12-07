import UIKit

func createArray (length: Int) -> ([Int]) {
    var arrayOfInt: [Int] = []
    for _ in 1...length {
        arrayOfInt.append(Int.random(in: 1...length))
    }
    return arrayOfInt
}



