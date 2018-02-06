//: [Previous](@previous)
/*:
 ## For Loops

 For loops are a way to repeat a set of statements a certain number of times.
 
 - Note:
 The traditional 'C-style' loop does not exists in Swift anymore: `for ( int i = 0; i<10; i++ )`. Instead, you create for loops that perform your set of statements for each item in a range or collection.
 */

// This is our collection
let pets = ["dog", "cat", "pig", "parrot"]

// This is the for loop grabbing each item and performing actions
for pet in pets {
  print(pet)
}

/*:
 We can declare a for loop using a range with a lower bound and upper bound
 - Example: `2...5` or `2..<5`
 */

for i in 2...5 {
  print("My Current Index: \(i)")
}

/*:
 - Experiment:
 What's the difference between `2...5` vs `2..<5`?
 */

for i in 2..<5 {
  print("My Current Index: \(i)")
}

/*:
 - Experiment:
 Use a ranged for loop to search through the 'pets' array above for the word 'pig' and print out its index.
 */

for i in 0..<pets.count {
  if pets[i] == "pig" {
    print("pig idex = \(i)")
  }
}

/*:
 - Experiment:
 Create an array of random numbers of your choosing then make a for loop that adds 1 to each number.
 */

var randomNumz = [1, 23, 5, 34, 64, 123, 65]
for i in 0..<randomNumz.count {
  randomNumz[i] += 1
}

/*:
 - Experiment:
 Take a look at the example below. Modify the code so that it searches for both the largest and smallest number. Then print out the result.
 */

/*:
 Hint: Use an `_` so that you can avoid making another unecessary variable for the iteration value.
 */

let interestingNumbers = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var smallest = 999
for (_, numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
    }
    if number < smallest {
      smallest = number
    }
  }
}
print(largest)
print(smallest)
/*:
 - Callout(Challenge):
 Given a number `N`, from 0 to `N`, add up all the odd numbers and print out the result.
 ie: N = 5, 1+3+5 = 9
 */

let N = 26
var sum = 0
for i in 0...N {
  if i % 2 != 0 {
    sum += i
  }
}
print(sum)

/*:
 - Callout(Challenge):
 Given the following array of numbers, determine the frequency of each number using a for loop.
 
 ie: [1, 2, 1, 3, 3, 1, 1, 1]
 
 1: Occurs 5 times
 
 2: Occurs 1 time
 
 3: Occurs 2 times
 */

let numberArray = [1, 4, 5, 5, 5, 3, 2, 1, 4, 2, 2, 2, 1]
var occurances : [Int : Int] = [:]

for n in numberArray {
  if occurances[n] == nil {
    occurances[n] = 1
  }
  else {
    occurances[n]! += 1
  }
}

for (i, j) in occurances {
  print("\(i): Occurs \(j) times")
}

//: [Next](@next)
