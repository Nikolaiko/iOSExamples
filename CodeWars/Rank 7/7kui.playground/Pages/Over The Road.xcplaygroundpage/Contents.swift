/*

 You've just moved into a perfectly straight street with exactly n identical houses on either side of the road. Naturally, you would like to find out the house number of the people on the other side of the street. The street looks something like this:

 Street
 1|   |6
 3|   |4
 5|   |2
 you
 Evens increase on the right; odds decrease on the left. House numbers start at 1 and increase without gaps. When n = 3, 1 is opposite 6, 3 opposite 4, and 5 opposite 2.

 */

import Foundation

func overTheRoad(_ address: Int,_ street: Int) -> Int {
    var result = -1
    let oddMax = 1 + (2 * (street - 1))
    let evenMax = (2 * street)

    if address % 2 == 0 {
        if address > evenMax {
            return 0
        }
        let coff = (address / 2) - 1
        result = oddMax - (2 * coff)
    } else {
        if address > oddMax {
            return 0
        }
        let coff = (oddMax - address) / 2
        result = 2 + (2 * coff)
    }
    return result;
}

print(overTheRoad(3,3))
print(overTheRoad(3,5))
print(overTheRoad(17,8))
