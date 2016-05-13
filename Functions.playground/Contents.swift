//: Playground - noun: a place where people can play

import UIKit

/*  =============================================================
 
                        Functions

============================================================= */
//  When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output, known as return type.

func sayHello(personName: String) -> String {
  let greeting = "Hello, \(personName)!"
  return greeting
}

print(sayHello("Anna"))
print(sayHello("Jason"))
print(sayHello("Fuckface"))

//  You can simplify the function above like so:

func sayHelloAgain(personName: String) -> String {
  return "Hello again, \(personName)"
}

print(sayHelloAgain("Fuckface"))


/* --------------------------------------------------------
 
        Function Parameters && Return Values

--------------------------------------------------------*/

//  Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.

//  Functions without parameters
//  ————————————————————————————
//  functions are not required to have input parameters.

func sayHelloWorld() -> String {
  return "hello, world"
}

print(sayHelloWorld())

//  Functions with multiple parameters
//  ——————————————————————————————————
//  functions can have multiple inputs

func sayHelloIntelligently(personName: String, alreadyGreeted: Bool) -> String {
  if alreadyGreeted {
    return sayHelloAgain(personName)
  } else {
    return sayHello(personName)
  }
}

print(sayHelloIntelligently("Tim", alreadyGreeted: true))

//  When calling a function with more than one parameter, any argument after the first is labeled according to its corresponding parameter name. Function parameter naming is described in more detail in Function Parameter Names.


//  Functions without return values
//  ———————————————————————————————

func sayGoodbye(personName: String) {
  print("Goodbye, \(personName)")
}

sayGoodbye("Dave")

//  The return value of a function can be ignored when it is called:

func printAndCount(stringToPrint: String) -> Int {
  print(stringToPrint)
  return stringToPrint.characters.count
}

func printWithoutCounting(stringToPrint: String) {
  printAndCount(stringToPrint)
}

let count = printAndCount("hello, world")
print(count)
// prints "hello, world" and returns a value of 12
let emptyvalue = printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value
print(emptyvalue)

//  Default Parameter Values
//  ————————————————————————

func someFunction(parameterWithDefault: Int = 12) {
  // function body goes here
  // if no arguments are passed to the function call,
  // value of parameterWithDefault is 12
}
someFunction(6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12

//  NOTE: Place parameters with default values at the end of a function’s parameter list. This ensures that all calls to the function use the same order for their nondefault arguments, and makes it clear that the same function is being called in each case.

//  Variadic Parameters
//  ————————————————————

func arithmeticMean(numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
// returns 3.0, which is the arithmetic mean of these five numbers
print(arithmeticMean(3, 8.25, 18.75))
// returns 10.0, which is the arithmetic mean of these three numbers




/* --------------------------------------------------------

                    Function types

 --------------------------------------------------------*/

//  Every function has a specific function type, made up of the parameter types and the return type of the function.

func addTwoInts(a: Int, _ b: Int) -> Int {
  return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
  return a * b
}

//  This example defines two simple mathematical functions called addTwoInts and multiplyTwoInts. These functions each take two Int values, and return an Int value, which is the result of performing an appropriate mathematical operation.

//  The type of both of these functions is (Int, Int) -> Int. This can be read as:

func printHelloWorld() {
  print("hello, world")
}

//  the type of this function is () -> Void, or "a function that has no parameters and returns Void"

//  using Function types
//  –———————————————————
//  You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable.


var mathFunction: (Int, Int) -> Int = addTwoInts

//  you can now call the assigned function with the name mathFunction:

print("Result: \(mathFunction(2,3))")

//  As with any other type, you can leave it to Swift to infer the function type when you assign a function to a constant or variable:

let anotherMathFunction = addTwoInts

//  Function Types as Parameter Types
//  —————————————————————————————————

//  You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function's implementation for the function's caller to provide when the function is called. 

func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
  print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3,5)
printMathResult(multiplyTwoInts, 5,5)

//  Function Types as Return Types
//  ——————————————————————————————

// You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.

func stepForward(input: Int) -> Int {
  return input + 1
}

func stepBackward(input: Int) -> Int {
  return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
  return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
print(moveNearerToZero)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
  print("\(currentValue)... ")
  currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!




























