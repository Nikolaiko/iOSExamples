import Foundation

func isNegativeZero(_ n: Float) -> Bool {
    n == 0.0 && n.sign == .minus
}

print(isNegativeZero(0.0))
print(isNegativeZero(-0.0))
print(isNegativeZero(1.0))
