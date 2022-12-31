/*
 Find the total sum of internal angles (in degrees) in an n-sided simple polygon. N will be greater than 2.
 */

import Foundation

func angle(_ n: Int) -> Int {
    (2 * n - 4) * 90
}

print(angle(4))
print(angle(6))
print(angle(3))
