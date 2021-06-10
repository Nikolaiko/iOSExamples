/*
 Given a random non-negative number, you have to return the digits of this number within an array in reverse order.
 */

func digitize(_ num:Int) -> [Int] {
    String(num).reversed().map { element in
        Int(String(element)) ?? 0
    }
}

print(digitize(348597))
