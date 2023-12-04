import Foundation

/*
 You forgot to count the number of toast you put into there, you don't know if you put exactly six pieces of toast into the toasters.

 Define a function that counts how many more (or less) pieces of toast you need in the toasters. Even though you need more or less, the number will still be positive, not negative.
 */

func sixToast(_ num: Int) -> Int {
  return abs(num - 6)
}


print(sixToast(12))
