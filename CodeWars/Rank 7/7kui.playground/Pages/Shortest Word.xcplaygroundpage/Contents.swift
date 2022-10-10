/*
 Simple, given a string of words, return the length of the shortest word(s).

 String will never be empty and you do not need to account for different data types.
 */

import Foundation

func find_short(_ str: String) -> Int
{
    let splitted = str.components(separatedBy: " ")
    var minLength = Int.max

    splitted.forEach { word in
        if minLength > word.count {
            minLength = word.count
        }
    }
    return minLength
}

print(find_short("bitcoin take over the world maybe who knows perhaps"))
print(find_short("Let's travel abroad shall we"))
