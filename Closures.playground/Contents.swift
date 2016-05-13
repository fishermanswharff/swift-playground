//: Playground - noun: a place where people can play

import UIKit

/* ==============================================================

                            Closures
 
  ============================================================== */

//  Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

//  Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var reversed = names.sort(backwards)

//  Closure expression syntax:

/*

{ (parameters) -> returnType in
  statements
}
 
*/

reversed = names.sort({ (s1: String, s2: String) -> Bool in
  return s1 > s2
})

//  because the body of the closure is so short, it can even be written as a one-liner:

reversed = names.sort( {(s1: String, s2: String) -> Bool in return s1 > s2} )

//  inferring type from context
//  because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns. 

reversed = names.sort({ s1, s2 in return s1 > s2 })

print(reversed)

//  Implicit returns from single expression closures
//  single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration, as in this version of the previous example:

reversed = names.sort({ s1,s2 in s1 > s2 })

print(reversed)

//  Shorthand argument names
//  swift automatically provides shorthand arugment names to inline closures, which can be used to refer to the values of the closures arugments by the names $0, $1, $2, and so on. If you use these arguments, you can omit the closure's arguments list from the its definition, and the number and type of the shorthand argument names will be inferred. The in keyword can also be omitted, because the closure expression is made up entirely of its body:

reversed = names.sort({ $0 > $1 })

print(reversed)

//  Operator functions
//  swift's string type defineds its string-specific implementation of the greater-than operator (>) as a function that has two aprameters of type String, and returns a value of type Bool. This exactly matches the function type needed by the sort(_:) method. That means you can simply pass in the great-than operator, and swift will infer that you want to use its string-specific implementation.

reversed = names.sort(>)

print(reversed)


/* ————————————————————————————————————————————————————————
 
                  Trailing Closures
 
———————————————————————————————————————————————————————— */
//  if you need to pass a closure expression to a function as the function's final argument and the closure expression is long, it can useful to write it as a trailing closure instead.


reversed = names.sort() { $0 > $1 }

print(reversed)


func someFunctionThatTakesAClosure(closure: () -> Void) {
  // function body goes here
}

//  call it w/out trailing closure
someFunctionThatTakesAClosure({
  // closures body goes here
})

//  calls it w a trailing closure:
someFunctionThatTakesAClosure() {
  // trailing closure body goes here
}

//  if a closure expression is provided as the function or method's only argument and you provide that expression as a trailing closure, you do not need to write the parens after the function or method's name when you call the function:

reversed = names.sort { $0 > $1 }

print(reversed)

























