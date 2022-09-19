import Foundation
import Darwin

/*
 Write a method, that will get an integer array as parameter and will process every number from this array.

 Return a new array with processing every number of the input-array like this:

 If the number has an integer square root, take this, otherwise square the number.
 */

func squareOrSquareRoot(_ input: [Int]) -> [Int] {
    input.map { currentElement in
        var root: Int? = nil
        for check in 0...currentElement - 1 {
            if check * check == currentElement {
                root = check
                break
            }
        }
        return (root == nil ? currentElement * currentElement : root) ?? 0
    }
}


print(squareOrSquareRoot([4,3,9,7,2,1]))

