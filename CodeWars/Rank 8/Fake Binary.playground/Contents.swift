/*
 Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.
 */

import Foundation

func fakeBin(digits: String) -> String {
    digits.reduce("") { curRes, curChar -> String in
        "\(curRes)\(curChar < "5" ? "0" : "1")"
    }
}

print(fakeBin(digits: "45385593107843568"))
