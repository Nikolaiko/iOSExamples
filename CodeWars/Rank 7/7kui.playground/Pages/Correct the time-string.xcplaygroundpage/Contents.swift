/*
 A new task for you!

 You have to create a method, that corrects a given time string.
 There was a problem in addition, so many of the time strings are broken.
 Time is formatted using the 24-hour clock, so from 00:00:00 to 23:59:59.
 Examples
 "09:10:01" -> "09:10:01"
 "11:70:10" -> "12:10:10"
 "19:99:99" -> "20:40:39"
 "24:01:01" -> "00:01:01"
 If the input-string is null or empty return exactly this value! (empty string for C++) If the time-string-format is invalid, return null. (empty string for C++)

 Have fun coding it and please don't forget to vote and rank this kata! :-)

 I have created other katas. Have a look if you like coding and challenges.
 */

import Foundation

func correctTime(_ timeString: String?) -> String? {
    guard let time: String = timeString else { return nil }
    guard timeString!.count > 0 else { return timeString }

    let secondsInMinutes = 60
    let minutesInHours = 60
    let maxHours = 24

    let secondsIndex = 2
    let minutesIndex = 1
    let hoursIndex = 0

    let timeParts = time.split(separator: ":")
    guard timeParts.count == 3 else { return nil }

    guard var secondsMainPart: Int = Int(timeParts[secondsIndex]) else { return nil }
    var additionalMinutes = 0

    if secondsMainPart >= secondsInMinutes {
        additionalMinutes = secondsMainPart / secondsInMinutes
        secondsMainPart = secondsMainPart % secondsInMinutes
    }

    guard var minutesMainPart: Int = Int(timeParts[minutesIndex]) else { return nil }
    minutesMainPart += additionalMinutes

    var additionalHours = 0
    if minutesMainPart >= minutesInHours {
        additionalHours = minutesMainPart / minutesInHours
        minutesMainPart = minutesMainPart % minutesInHours
    }

    guard var hoursMainPart: Int = Int(timeParts[hoursIndex]) else { return nil }
    hoursMainPart += additionalHours

    if hoursMainPart >= maxHours {
        hoursMainPart = hoursMainPart - ((hoursMainPart / maxHours) * maxHours)
    }

    var secondsString = "\(secondsMainPart)"
    if secondsString.count <= 1 {
        secondsString = "0\(secondsString)"
    }

    var minutesString = "\(minutesMainPart)"
    if minutesString.count <= 1 {
        minutesString = "0\(minutesString)"
    }

    var hoursString = "\(hoursMainPart)"
    if hoursString.count <= 1 {
        hoursString = "0\(hoursString)"
    }



    return "\(hoursString):\(minutesString):\(secondsString)"
}

print(correctTime(nil))
print(correctTime("19:99:99"))
print(correctTime("24:01:01"))
print(correctTime("52:01:01"))

