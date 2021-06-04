/*
 This time no story, no theory. The examples below show you how to write function accum:

 Examples:

 accum("abcd") -> "A-Bb-Ccc-Dddd"
 accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
 accum("cwAt") -> "C-Ww-Aaa-Tttt"
 The parameter of accum is a string which includes only letters from a..z and A..Z.
 */

import UIKit

func accum(_ s: String) -> String {
    var result = ""
    var index = 0
    s.forEach { character in
        result += character.uppercased()
        result += String.init(
            repeating: character.lowercased(),
            count: index
        )
        result += (index < s.count - 1) ? "-" : ""
        index += 1
    }
    return result
}

print(accum("RqaEzty"))
