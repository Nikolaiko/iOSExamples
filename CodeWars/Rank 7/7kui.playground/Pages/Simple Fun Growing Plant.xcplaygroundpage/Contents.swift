/*
 Task
 Each day a plant is growing by upSpeed meters. Each night that plant's height decreases by downSpeed meters due to the lack of sun heat. Initially, plant is 0 meters tall. We plant the seed at the beginning of a day. We want to know when the height of the plant will reach a certain level.
 
 Example
 For upSpeed = 100, downSpeed = 10 and desiredHeight = 910, the output should be 10.
 */

import Foundation

func growingPlant(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var plantHeight = 0
    var days = 0
    
    while (plantHeight < desiredHeight) {
        plantHeight += upSpeed
        days += 1
        if (plantHeight < desiredHeight) {
            plantHeight -= downSpeed
        } else {
            break
        }
    }
    return days
}

print(growingPlant(100, 10, 910))
print(growingPlant(10, 9, 4))
print(growingPlant(5, 2, 5))
