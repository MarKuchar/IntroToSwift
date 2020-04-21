import Foundation
/*:
 ## Exercise - While Loops
 
 Create a while loop that simulates rolling a 6-sided dice repeatedly until a 1 is rolled. After each roll, print the value. (Hint: use `Int.random(in: 1...6)` to generate a random number between 1 and 6).
 */
while true {
    var i = Int.random(in: 1...6)
    print(i)
    if i == 1 {
        break
    }
}

//: [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - While Loops](@next)
