/*
 King Arthur and his knights are having a New Years party. Last year Lancelot was jealous of Arthur, because Arthur had a date and Lancelot did not, and they started a duel.

 To prevent this from happening again, Arthur wants to make sure that there are at least as many women as men at this year's party. He gave you a list of integers of all the party goers.

 Arthur needs you to return true if he needs to invite more women or false if he is all set.

 An array (guaranteed non-associative in PHP) representing the genders of the attendees, where -1 represents women and 1 represents men.

 */

import Foundation

func inviteMoreWomen(_ arr: [Int]) -> Bool {
    return arr.filter { element in element == 1}.count
    > arr.filter({ element in element == -1 }).count

}

print(inviteMoreWomen([1, -1, 1]))
print(inviteMoreWomen([1, 1, 1]))
