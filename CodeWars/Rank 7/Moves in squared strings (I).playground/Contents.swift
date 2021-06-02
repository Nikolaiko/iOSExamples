import UIKit

/*
 This kata is the first of a sequence of four about "Squared Strings".

 You are given a string of n lines, each substring being n characters long: For example:

 s = "abcd\nefgh\nijkl\nmnop"

 We will study some transformations of this square of strings.

 Vertical mirror: vert_mirror (or vertMirror or vert-mirror)
 vert_mirror(s) => "dcba\nhgfe\nlkji\nponm"
 Horizontal mirror: hor_mirror (or horMirror or hor-mirror)
 hor_mirror(s) => "mnop\nijkl\nefgh\nabcd"
 or printed:

 vertical mirror   |horizontal mirror
 abcd --> dcba     |abcd --> mnop
 efgh     hgfe     |efgh     ijkl
 ijkl     lkji     |ijkl     efgh
 mnop     ponm     |mnop     abcd
 Task:
 Write these two functions
 and

 high-order function oper(fct, s) where

 fct is the function of one variable f to apply to the string s (fct will be one of vertMirror, horMirror)

 Examples:
 s = "abcd\nefgh\nijkl\nmnop"
 oper(vert_mirror, s) => "dcba\nhgfe\nlkji\nponm"
 oper(hor_mirror, s) => "mnop\nijkl\nefgh\nabcd"
 */

func horMirror(_ s: String) -> String {
    var lines = s.split(separator: "\n")
    let maxIndex = lines.count - 1
    var mirrored = "";
    
    for index in 0...maxIndex / 2 {
        let temp = lines[maxIndex - index]
        lines.swapAt(index, maxIndex - index)
        
    }
    
    for index in 0...maxIndex {
        mirrored += lines[index]
        if index < maxIndex {
            mirrored += "\n"
        }
    }
    return mirrored
}

func vertMirror(_ s: String) -> String {
    let lines = s.split(separator: "\n")
    var mirrored = "";
    
    for index in 0...lines.count - 1 {
        mirrored += String(lines[index].reversed())
        if index < lines.count - 1 {
            mirrored += "\n"
        }
    }
    return mirrored
}

func oper(_ fnc: ((String)->String), _ s: String) -> String {
    return fnc(s)
}

let s = "abcd\nefgh\nijkl\nmnop"
print(oper(horMirror, s))
print("-----")
print(oper(vertMirror, s))

