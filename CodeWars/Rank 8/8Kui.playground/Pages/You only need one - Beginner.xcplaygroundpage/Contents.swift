/*
 You will be given an array a and a value x. All you need to do is check whether the provided array contains the value.

 The type of a and x can be String or Int.

 Return true if the array contains the value, false if not.
 */

import Foundation

func check<T: Equatable>(_ a: [T], _ x: T) -> Bool {
    a.contains(x)
}


print(check([1,2,3,4], 4))
print(check(["1","2","3","4"], "4"))
