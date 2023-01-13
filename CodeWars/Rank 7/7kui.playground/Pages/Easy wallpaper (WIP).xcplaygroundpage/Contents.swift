/*
 John wants to decorate the walls of a room with wallpaper. He wants a fool-proof method for getting it right.

 John knows that the rectangular room has a length of l meters, a width of w meters, a height of h meters. The standard width of the rolls he wants to buy is 52 centimeters. The length of a roll is 10 meters. He bears in mind however, that it’s best to have an extra length of wallpaper handy in case of mistakes or miscalculations so he wants to buy a length 15% greater than the one he needs.

 Last time he did these calculations he got a headache, so could you help John?

 Task
 Your function wallpaper(l, w, h) should return as a plain English word in lower case the number of rolls he must buy.

 Example:
 wallpaper(4.0, 3.5, 3.0) should return "ten"

 wallpaper(0.0, 3.5, 3.0) should return "zero"

 Notes:
 all rolls (even with incomplete width) are put edge to edge

 0 <= l, w, h (floating numbers); it can happens that w * h * l is zero

 the integer r (number of rolls) will always be less or equal to 20

 FORTH: the number of rolls will be a positive or null integer (not a plain English word; this number can be greater than 20)

 In Coffeescript, Javascript, Python, Ruby and Scala the English numbers are preloaded and can be accessed as:

 numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve","thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
 For other languages it is not preloaded and you can instead copy the above list if you desire.
 */

import Foundation

func wallpaper(_ l: Double, _  w: Double,_  h: Double) -> String {
    let numbers = ["zero", "one", "two", "three", "four", "five",
               "six", "seven", "eight", "nine", "ten",
               "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
    let rollWidth: Double = 10.0
    let rollHeight: Double = 0.52


    guard l > 0.0, w > 0.0, h > 0.0 else { return numbers[0] }

    var wholeDistance: Double = (l + w) * 2
    print(wholeDistance)
    //wholeDistance += (wholeDistance * 15.0) / 100.0
    //print(wholeDistance)


    var lengthCount = ceil(wholeDistance / rollHeight)
    //lengthCount += (lengthCount * 15.0) / 100.0
    print(lengthCount)
    print(h / rollHeight)

    var middle = (lengthCount * h)
    //middle += (middle * 15.0) / 100.0
    var totalCount = ceil(middle / rollWidth)

    let intResult = Int(totalCount)
    print(totalCount)

    return numbers[intResult]
}

print(wallpaper(4.0, 3.5, 3.0))
print(wallpaper(0.0, 3.5, 3.0))
print(wallpaper(6.3, 4.5, 3.29))
print(wallpaper(6.3, 5.8, 3.13))

