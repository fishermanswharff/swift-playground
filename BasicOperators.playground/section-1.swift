// Playground - noun: a place where people can play

import UIKit



/* ================================================================================
                            BASIC OPERATORS
================================================================================ */

/*
 Terminology: operators are unary, binary, or ternary:

Unary operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as i++). 

Binary operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.

Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).

The values that operators affect are operands. In the expression 1 + 2, the + symbol is a binary operator and its two operands are the values 1 and 2.

*/


/* ————————————————————————————————————————————————————————
 
                        assignment

———————————————————————————————————————————————————————— */

let b = 10
var a = 5
a = b

// If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once: 

let (x,y) = (1,2)
print(x,y, terminator: "")



/* ————————————————————————————————————————————————————————

                        Arithmetic

 ———————————————————————————————————————————————————————— */
1 + 2
5 - 3
2 * 3
10.0 / 2.5

// the addition operator is also supported for String concatenation

"hello, " + "world"

/* ————————————————————————————————————————————————————————

                        Modulo

 ———————————————————————————————————————————————————————— */

9 % 4 // => 1

//  the modulo operator returns the remainder of the division, so 4 goes into 9 twice (4x2=8) with a remainder of 1, so 1 is returned from the above operation

// Unlike the remainder operator in C and Objective-C, Swift’s remainder operator can also operate on floating-point numbers: 

8 % 2.5 // => .5




/* ————————————————————————————————————————————————————————

                  Compound Assignment

 ———————————————————————————————————————————————————————— */

var i = 0
i += 1
i += 1
i

//  each time you call i += 1 the value of i is increased by 1
i -= 1


/* ————————————————————————————————————————————————————————

                  unary minus operator

 ———————————————————————————————————————————————————————— */

// the sign of a numeric value can be toggled using a prefixed '-', known as the unary minus operator
let three = 3
let minusThree = -three
let plusThree = -minusThree


/* ————————————————————————————————————————————————————————

                  unary plus operator

 ———————————————————————————————————————————————————————— */
//  the unary plus operator (+) simply returns the value it operates on, without any change:
let minusSix = -6
let alsoMinusSix = +minusSix // equals -6
// Although the unary plus operator doesn’t actually do anything, you can use it to provide symmetry in your code for positive numbers when also using the unary minus operator for negative numbers.


/* ————————————————————————————————————————————————————————

                  Comparison Operators

 ———————————————————————————————————————————————————————— */

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
  print("hello world", terminator: "")
} else {
  print("I'm sorry \(name), but I don't recognize you.")
}


//  You can also compare tuples that have the same number of values, as long as each of the values in the tuple can be compared.
(1, "zebra") < (2, "apple") // true because 1 is less than 2
(3, "apple") < (3, "bird") // true because 3 equals 3, apple is less than bird
(4, "dog") == (4, "dog") // they're the same, equal


/* ————————————————————————————————————————————————————————

              Ternary Conditional Operator

 ———————————————————————————————————————————————————————— */
//recipe: question ? answer1 : answer2

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


//  Nil Coalescing Operator
//——————————————————————————————

/*  
The nil coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a.
    The nil coalescing operator is shorthand for the code below:

a != nil ? a! : b

The code above uses the ternary conditional operator and forced unwrapping (a!) to access the value wrapped inside a when a is not nil, and to return b otherwise. The nil coalescing operator provides a more elegant way to encapsulate this conditional checking and unwrapping in a concise and readable form.

If the value of a is non-nil, the value of b is not evaluated. This is known as short-circuit evaluation.

The example below uses the nil coalescing operator to choose between a default color name and an optional user-defined color name:
*/

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

/* 
The userDefinedColorName variable is defined as an optional String, with a default value of nil. Because userDefinedColorName is of an optional type, you can use the nil coalescing operator to consider its value. In the example above, the operator is used to determine an initial value for a String variable called colorNameToUse. Because userDefinedColorName is nil, the expression userDefinedColorName ?? defaultColorName returns the value of defaultColorName, or "red"

If you assign a non-nil value to userDefinedColorName and perform the nil coalescing operator check again, the value wrapped inside userDefinedColorName is used instead of the default.
*/

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName


/* ————————————————————————————————————————————————————————

                  Range Operators

 ———————————————————————————————————————————————————————— */

/*
Swift includes two range operators, which are shortcuts for expressing a range of values.

1.  Closed Range Operator:
————————————————————————————————
The closed range operator (a...b) defines a range that runs from a to b, and includes the values of a and b. The value of a must not be greater than b.

The closed range operator is useful when iterating over a range in which you want all of the values to be used, such as with a for-in loop.
*/

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


/* 
2.  Half-open range operator:
—————————————————————————————————
the half-open range operator (a..<b) defines a range that runs from a to b, but does not include b. It is said to be half-open because it contains its first value, but not its final value. As with the closed range operator, the value of a must not be greater than b. 

Half-open ranges are particularly useful when you work with zero-based lists such as arrays, where it is useful to count up to (but not including) the length of the list:
*/

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
  print("Person \(i + 1) is called \(names[i])")
}

/* 
Note that the array contains four items, but 0..<count only counts as far as 3 (the index of the last item in the array), because it is a half-open range.
*/


/* ————————————————————————————————————————————————————————

                  Logical Operators

 ———————————————————————————————————————————————————————— */

/*
Logical operators modify of combine the Boolean logic values true and false. Swift supports the three standard logical operators found in C-based languages.

Logical NOT (!a)
Logical AND (a && b)
Logical OR (a || b)


Logical NOT Operator
———————————————————
The logical not operator (!a) inverts a Boolean value so that true becomes false and false becomes true.

The logical NOT operator is a prefix operator and appears immediately before the value it operates on, without any white space. It can read as "not a" as seen in the following example.
*/

let allowedEntry = false
if !allowedEntry {
  print("ACCESS DENIED", terminator: "")
}

/* 
The phrase if !allowedEntry can be read as "if not allowed entry." The subsequent line is only executed if "not allowed entry" is true; that is, if allowedEntry is false.

As in this example, careful choice of Boolean constant and variable names can help to keep code readable and concise, while avoiding double negatives or confusing logic statements.
*/


//  Logic AND operator
//————————————————————

/*
The logical AND operator (a && b) creates logical expressions where both values must be true for the overall expression to also be true. If either value is false, the overall expression will also be false. In fact, if the first value is false, the second value won't even be evaluated because it can't possibly make the overall expression equate to true. This is known as short-circuit evaluation.

This example considers two Bool values and only allows access if both values are true:
*/

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
  print("Welcome")
} else {
  print("ACCESS DENIED")
}

//  Logical OR Operator
//——————————————————————
/*
  The logical OR operator (a || b) is an infix operator made from two adjacent pipe characters. You use it to create logical expressions in which only one of the two values has to be true for the overall expression to be true.

  Like the logical AND operator above, the logical OR operator uses short-circuit evaluation to consider its expressions. If the left side of a logical OR expression is true, the right side is not evaluated, because it cannot change the outcome of the overall expression.

  In the example below the first Bool value (hasDoorKey) is false, but the second value (knowsOverridePassword) is true. Because one value is true, the overall expression also evaluates to true, and access is allowed.
*/

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
  print("Welcome", terminator: "")
} else {
  print("ACCESS DENIED", terminator: "")
}


//  Combining Logical Operators
//——————————————————————————————

//  You can combine mutliple logic operators to create longer compound expressions:

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Welcome!")
} else {
  print("ACCESS DENIED")
}

//  this example uses multiple && and || operators to create a longer compound expression. However the && and || operators still operate on only two values, so this is actually three smaller expressions chained together. The example can be read as: If we've entered the correct door and passed the retina scann, or if we have a valid door key, or if we know the emergency override password, then allow access


//  Based on the values of enteredDoorCode, passedRetinaScan, and hasDoorKey, the first two mini-expressions are false. However, the emergency override password is known, so the overall compound expression still evaluates to true.

//  NOTE: The Swift logical operators && and || are left-associative, meaning that compound expressions with multiple logical operators evaluate the leftmost subexpression first.

//  Explicit Parentheses
//————————————————————————

//  It is sometimes useful to include parentheses when they are not strictly needed, to make the intention of a complex expression easier to read. In the door access example above, it is useful to add parentheses around the first part of the compound expression to make its intent explicit:

if(enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  print("Welcome")
} else {
  print("ACCESS DENIED")
}





















































