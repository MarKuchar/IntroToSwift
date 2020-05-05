/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && rhs.age == rhs.age
    }
    
    var description: String {
        return "\(name) : \(age)"
    }
    
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let martin = Human(name: "Martin", age: 26)
let jakub = Human(name: "Jacob", age: 24)

/*:
 Make the `Human` class adopt the `CustomStringConvertible`. Print both of your previously initialized `Human` objects.
 */
print(martin)
print(jakub)

/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
 */

print(martin == jakub)
print(martin != jakub)
/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let tomas = Human(name: "Tomas", age: 29)
let jozo = Human(name: "Joseph", age: 21)
let cousins = [martin, jakub, tomas, jozo]
let sortedCousins: [Human] = cousins.sorted()
print(cousins)
print(sortedCousins)
/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation
let json = JSONEncoder()
let jsonData = try json.encode(jozo)
print(jsonData)
if let stringData = String(data: jsonData, encoding: .utf8) {
    print(stringData)
}

//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
