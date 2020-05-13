//
//  main.swift
//  Closures
//
//  Created by Derrick Park on 5/13/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

// Closure?
// - lambda(python, java), closure(js, ...)
// - "a block of code that you can execute(call)" == function without a name

func sum(numbers: [Int]) -> Int {
  var total = 0
  for num in numbers {
    total += num
  }
  return total
}

/// Type of closure
let a: Int = 10

let sumClosure: ([Int]) -> Int = { (numbers: [Int]) -> Int in
  var total = 0
  for num in numbers {
    total += num
  }
  return total
}

print(sumClosure([1, 2, 3, 4, 5]))

/// Simplify Closure
// 1. swift - "type interence"
let sumClosureSimplified1: ([Int]) -> Int = { (numbers) in
  var total = 0
  for num in numbers {
    total += num
  }
  return total
}

// 2. arguments (syntactic sugar) can be referred as $0, $1, $2, ...
let sumClosureSimplified2: ([Int]) -> Int = {
  var total = 0
  for num in $0 {
    total += num
  }
  return total
}

func sumTwo(a: Int, b: Int) -> Int {
  return a + b
}

let sumTwoClosure: (Int, Int) -> Int = { (n1: Int, n2: Int) -> Int in
  return n1 + n2
}

// 3. Single 'return' statement -> do not need return keyword
let sumTwoClosure1: (Int, Int) -> Int = { $0 + $1 }


/// Pass closure as argument
let nums = [41, 2, 3, 77, 13, 21, 49, 1]

let compare = { (a: Int, b: Int) -> Bool in
  return a > b
}

let sortedNums = nums.sorted(by: compare)
print(sortedNums)

let sortedNums2 = nums.sorted(by: { (a: Int, b: Int) -> Bool in
  return a < b
})

print(sortedNums2)

// syntactic sugar
let sortedNums3 = nums.sorted { (a: Int, b: Int) -> Bool in
  return a < b
}

// simplified
let sortedNums4 = nums.sorted { $0 < $1 }


/// "Higher-order Functions"
/// - a function that takes a closure
/// - a function that returns a closure

/// 1. map     [...] mapping each element a -> b
/// 2. filter  [a, ..., z] -> [a, e, i, o, u]
/// 3. reduce  [1, 2, 3, 4, 5] -> 15 (+)

/// map ( a -> a + " Park" )
var names = ["Derrick", "Leo", "Sean"]  // ["Derrick Park", "Leo Park", "Sean Park"]

//let fullnames = names.map { (name) -> String in
//  return name + " Park"
//}

let fullnames = names.map { $0 + " Park" }

print(fullnames)

/// filter 'what is included'
var ages = [20, 21, 22, 53, 26, 25, 33, 31, 60, 38, 72, 54]
//let valid = ages.filter { (age) -> Bool in
//  return age <= 50
//}

let valid = ages.filter { $0 <= 50 }

print(valid)

/// reduce 'how are you going to reduce'
/// [20, 21, 22, 53, 26, 25, 33, 31, 60, 38, 72, 54]

let reducedAsSum = ages.reduce(0) { (currentResult, newValue) -> Int in
  return currentResult + newValue
}

print(reducedAsSum)

