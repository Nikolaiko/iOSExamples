/*
 Linked Lists - Push & BuildOneTwoThree

 Write push() and buildOneTwoThree() functions to easily update and initialize linked lists. Try to use the push() function within your buildOneTwoThree() function.

 Here's an example of push() usage:

 var chained = null
 chained = push(chained, 3)
 chained = push(chained, 2)
 chained = push(chained, 1)
 push(chained, 8) === 8 -> 1 -> 2 -> 3 -> null
 The push function accepts head and data parameters, where head is either a node object or null/None/nil. Your push implementation should be able to create a new linked list/node when head is null/None/nil.

 The buildOneTwoThree function should create and return a linked list with three nodes: 1 -> 2 -> 3 -> null
 */

import Foundation

class Node {
    var data: Int
    var next: Node?

    init(_ data: Int) {
        self.data = data;
    }
}

func push(_ head:Node?, _ data:Int) -> Node {
    var newNode = Node(data)
    newNode.next = head
    return newNode
}

func buildOneTwoThree() -> Node {
    var chained: Node?
    chained = push(chained, 3)
    chained = push(chained, 2)
    chained = push(chained, 1)
    return chained!
}


print(buildOneTwoThree())
