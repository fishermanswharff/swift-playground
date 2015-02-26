// Playground - noun: a place where people can play

import UIKit


/*  ——————————————————————————————————————————————
                      The Basics
——————————————————————————————————————————————    */

var str = "Hello, playground"
println("Hello world")

// use `let` to declare a constant, use `var` to declare a variable
var myVariable = 42
myVariable = 50
let myConstant = 42

//a constant of variable must have the same type as the value you want to assign it. however, you don't have to write the type explicitly.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//experiment
let myFloat: Float = 4

//values are never implicitly converted to another type. if you need to convert a value to a different type, explicity make an instance of the desired type

let label = "The width is"
let width = 94
let widthLabel = label + " " + String(width)

//this gives you an unsafe pointer error
//let widthLabel = label + " " + width

//use `\(string here)` to interpolate strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

//floating point calculation in string interpolation
let temp = 72.3
let difftemp = 23.4
let name = "Jason"
let mygreeting = "Hello \(name), it is \(temp - difftemp) degrees outside."

//Create arrays and dictionaries using brackets ([]) and access their elements by writing the index or key in brackets.

var shoppingList = ["catfish","water", "tulips","blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
  "Malcolm": "Captain",
  "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"

//to create an empty array or dictionary, use the initializer syntax
let emptyArray = [String()]
let emptyDictionary = Dictionary<String, Float>()

//if type information can be inferred, you can write an empty array as `[]` and an empty dictionary as [:]—for example, when you set a new value for a variable or pass an argument to a function

shoppingList = []


/*—————————————————————————————————————————————————
              CONTROL FLOW
—————————————————————————————————————————————————*/

//use `if` and `switch` to make conditionals, and use `for-in`, `for`, `while`, and `do-while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required

let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
teamScore

//in an if statement, the conditional must be a Boolean, this means that code such as `if score {...}` is an error, not an implicit comparison to 0
//You can use `if` and `let` together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that the value is missing. Wrie a question mark (?) after the type of a value to mark the value as optional.

var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}


//If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.


let vegetable  = "red pepper"
switch vegetable {
  case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
  case "cucumber":
    let vegetableComment = "That would make a good tea sandwich"
  case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
  default:
    let vegetableComment = "Everything tastes good in soup"
}

//Try removing the default case. What error do you get?


//Use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair
let interestingNumbers = [
  "Prime":[2,3,5,7,11,13],
  "Fibonacci": [1,1,2,3,5,8],
  "Square": [1,4,9,16,25],
]

var largest = 0
var kindOfNumber: String? = ""
for(kind,numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
      kindOfNumber = kind
    }
  }
}

largest
kindOfNumber

//Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once
var n = 2
while n < 200 {
  n = n*2
}
n

var m = 2
do {
  m = m*2
} while m < 100
m

//You can keep an index in a loop—either by using `..` to specify a range or by writing an explicit initialization, condition and increment. These two loops do the same thing:

var firstForLoop = 0
for i in 1...3 {
  firstForLoop += i
}
firstForLoop


/*  —————————————————————————————————————————————

            Functions and Closures

————————————————————————————————————————————  */

//use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses
func greet(name: String, day: String) -> String {
  return "Hello \(name), today is \(day)"
}

greet("Jason", "Wednesday")

func displayLunchSpecial(name: String, special: String) -> String {
  return "Hello, \(name), today's lunch special is \(special)"
}

displayLunchSpecial("Monica","Cod baked in Quaker State")

// use a tuple to return multiple values from a function
func getGasPrices() -> (Double, Double, Double) {
  return (3.59, 3.69, 3.79)
}
getGasPrices()


//functions can also take a variable number of arguments, collecting them into an array
func sumOf(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum
}

sumOf()
sumOf(42,597,12)

//write a function that calculates the average of its arguments
func average(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum/numbers.count
}
average(42,597,12)

//functions can be nested. Nested functions have access to variables that were declared in the outer function. 

func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
returnFifteen()

//functions are a first-class type. This means that a function can return another function as its value

func makeIncrementer() -> (Int -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}

var increment = makeIncrementer()
increment(7)
























































