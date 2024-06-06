/*
 Resistors are electrical components marked with colorful stripes/bands to indicate both their resistance value in ohms and how tight a tolerance that value has. While you could always get a tattoo like Jimmie Rodgers to help you remember the resistor color codes, in the meantime, you can write a function that will take a string containing a resistor's band colors and return a string identifying the resistor's ohms and tolerance values.

 The resistor color codes
 You can see this Wikipedia page for a colorful chart, but the basic resistor color codes are:

 black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, gray: 8, white: 9

 Each resistor will have at least three bands, with the first and second bands indicating the first two digits of the ohms value, and the third indicating the power of ten to multiply them by, for example a resistor with the three bands "yellow violet black" would be 47 * 10^0 ohms, or 47 ohms.

 Most resistors will also have a fourth band that is either gold or silver, with gold indicating plus or minus 5% tolerance, and silver indicating 10% tolerance. Resistors that do not have a fourth band are rated at 20% tolerance. (There are also more specialized resistors which can have more bands and additional meanings for some of the colors, but this kata will not cover them.)

 Your mission
 The way the ohms value needs to be formatted in the string you return depends on the magnitude of the value:

 For resistors less than 1000 ohms, return a string containing the number of ohms, a space, the word "ohms" followed by a comma and a space, the tolerance value (5, 10, or 20), and a percent sign. For example, for the "yellow violet black" resistor mentioned above, you would return "47 ohms, 20%".

 For resistors greater than or equal to 1000 ohms, but less than 1000000 ohms, you will use the same format as above, except that the ohms value will be divided by 1000 and have a lower-case "k" after it. For example, for a resistor with bands of "yellow violet red gold", you would return "4.7k ohms, 5%"

 For resistors of 1000000 ohms or greater, you will divide the ohms value by 1000000 and have an upper-case "M" after it. For example, for a resistor with bands of "brown black green silver", you would return "1M ohms, 10%"

 Test case resistor values will all be between 10 ohms and 990M ohms.

 More examples, featuring some common resistor values
 "brown black black"                "10 ohms, 20%"
 "brown black brown gold"          "100 ohms, 5%"
 "red red brown"                   "220 ohms, 20%"
 "orange orange brown gold"        "330 ohms, 5%"
 "yellow violet brown silver"      "470 ohms, 10%"
 "blue gray brown"                 "680 ohms, 20%"
 "brown black red silver"           "1k ohms, 10%"
 "brown black orange"              "10k ohms, 20%"
 "red red orange silver"           "22k ohms, 10%"
 "yellow violet orange gold"       "47k ohms, 5%"
 "brown black yellow gold"        "100k ohms, 5%"
 "orange orange yellow gold"      "330k ohms, 5%"
 "red black green gold"             "2M ohms, 5%"
 */

import Foundation

enum BandColors: String {
    case black, brown, red, orange, yellow, green, blue, violet, gray, white, silver, gold

    var digit: Int {
        switch self {
        case .black:
            return 0
        case .brown:
            return 1
        case .red:
            return 2
        case .orange:
            return 3
        case .yellow:
            return 4
        case .green:
            return 5
        case .blue:
            return 6
        case .violet:
            return 7
        case .gray:
            return 8
        case .white:
            return 9
        case .silver:
            return 10
        case .gold:
            return 5
        }
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

func decodeResistorColors(_ bands: String) -> String {
    var ohms = "ohms"
    var bandStrings = bands.components(separatedBy: " ")


    let firstDigit = BandColors(rawValue: bandStrings[0])!
    let secondDigit = BandColors(rawValue: bandStrings[1])!
    let powDigit = BandColors(rawValue: bandStrings[2])!
    let tight = bandStrings.count > 3 ? BandColors(rawValue: bandStrings[3])!.digit : 20

    let totalValue = Double((firstDigit.digit * 10 + secondDigit.digit) * Int(pow(Double(10), Double(powDigit.digit))))
    let delimetr: Double
    let letter: String
    if totalValue >= 1000000 { delimetr = 1000000; letter = "M" }
    else if totalValue >= 1000 { delimetr = 1000; letter = "k" }
    else { delimetr = 1; letter = "" }

    let rounded = Double((totalValue / delimetr * 10) / 10)
    return "\(rounded.removeZerosFromEnd())\(letter) ohms, \(tight)%"
}


print(decodeResistorColors("yellow violet orange gold"))
print(decodeResistorColors("red black green gold"))
print(decodeResistorColors("yellow violet red gold"))
