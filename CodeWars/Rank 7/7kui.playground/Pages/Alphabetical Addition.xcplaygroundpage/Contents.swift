/*

 Your task is to add up letters to one letter.

 The function will be given an Array<Character>, each one being a letter to add, and the function will return a Character.

 Notes:
 Letters will always be lowercase.
 Letters can overflow (see second to last example of the description)
 If no letters are given, the function should return 'z'
 Examples:
 addLetters(["a", "b", "c"]) = "f"
 addLetters(["a", "b"]) = "c"
 addLetters(["z"]) = "z"
 addLetters(["z", "a"]) = "a"
 addLetters(["y", "c", "b"]) = "d" // notice the letters overflowing
 addLetters([]) = "z"

 Tip: Each letter have index a = 1, b = 2, c = 3
 */

import Foundation

func addLetters(_ letters: [Character]) -> Character {
    guard !letters.isEmpty else { return "z" }

    let aCodeMinusOne = 96
    let maxLetterCount = 26
    var sum = 0

    letters.forEach { cur in
        sum += Int(cur.asciiValue!) - aCodeMinusOne
    }

    if sum > maxLetterCount {
        sum = sum % maxLetterCount == 0 ? maxLetterCount : (sum % maxLetterCount)
    }
    sum = sum + aCodeMinusOne

    let scalar = UnicodeScalar(UInt8(sum))
    return Character(scalar)
}

print(addLetters(["a", "b", "c"]))
print(addLetters(["a", "b"]))
print(addLetters(["y", "c", "b"]))
print(addLetters([]))

