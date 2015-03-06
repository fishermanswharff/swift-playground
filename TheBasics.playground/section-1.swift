// Playground - noun: a place where people can play

import UIKit

/*  THE BASICS
——————————————————————————————————————————

Swift is a new programming language for iOS and OS X app development. Nonetheless, many parts of Swift will be familiar from your experience of developing in C and Objective-C.

Swift provides its own versions of all fundamental C and Objective-C types, including Int for integers, Double and Float for floating-point values, Bool for Boolean values, and String for textual data. Swift also provides powerful versions of the two primary collection types, Array and Dictionary, as described in Collection Types.

Like C, Swift uses variables to store and refer to values by an identifying name. Swift also makes extensive use of variables whose values cannot be changed. These are known as constants, and are much more powerful than constants in C. Constants are used throughout Swift to make code safer and clearer in intent when you work with values that do not need to change.

In addition to familiar types, Swift introduces advanced types not found in Objective-C, such as tuples. Tuples enable you to create and pass around groupings of values. You can use a tuple to return multiple values from a function as a single compound value.

Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Optionals are similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Optionals are safer and more expressive than nil pointers in Objective-C and are at the heart of many of Swift’s most powerful features.

Optionals are an example of the fact that Swift is a type safe language. Swift helps you to be clear about the types of values your code can work with. If part of your code expects a String, type safety prevents you from passing it an Int by mistake. This restriction enables you to catch and fix errors as early as possible in the development process.

*/



/*  Constants and Variables  */
/*———————————————————————————*/

//constants and variables must be declared before they are used.

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// This code can be read as: “Declare a new constant called maximumNumberOfLoginAttempts, and give it a value of 10. Then, declare a new variable called currentLoginAttempt, and give it an initial value of 0.”

// You can declare multiple constants or multiple variables on a single line, separated by commas: 
var x = 0.0, y = 0.0, z = 0.0

// NOTE: if a stored value in your code is not going to change, always declare it as a constant with the `let` keyword. Use variables only for storing values that need to be able to change.



/*      Type Annotations     */
/*———————————————————————————*/

// You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store.

var welcomeMessage: String

//  This example provides a type annotation for a variable called welcomeMessage, to indicate that the variable can store String values. The welcomeMessage variable can now be set to any string value without error:

welcomeMessage = "Hello"

//  NOTE:  It is rare that you need to write type annotations in practice. If you provide an initial value for a constant or variable at the point that it is defined, Swift can almost always infer the type to be used for that constant or variable, as described in Type Safety and Type Inference. In the welcomeMessage example above, no initial value is provided, and so the type of the welcomeMessage variable is specified with a type annotation rather than being inferred from an initial value.

// You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name:

var red, green, blue: Double


/*  Naming Constants and Variables    */
/*————————————————————————————————————*/

//constant and variable names can contain almost any character, including Unicode characters:

let π = 3.14159

let 你好 = "你好世界"

let 🐶🐮 = "dogcow"

//  NOTE:  If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with back ticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.


//  You can change the value of an existing variable to another value of a compatible type:

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour"

//  Unlike a variable, the value of a constant cannot be changed once it is set. Attempting to do so i reported as an error when your code is compiled

let languageName = "Swift"
//languageName = "Swift++"
//this is a compile-time error - languageName cannot be changed

//  You can print the current value of a constant or variable with println function

println(friendlyWelcome)


//  println is a global function that prints a value, followed by a line break, to an appropriate output. In Xcode, for example, println prints its output in Xcode's console pane. The println function prints any String value you pass to it.

println("Hello World")

//  Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable. Wrap the name in parentheses and escape it with a backslash before the opening parenthesis:

println("The current value of friendlyWelcome is \(friendlyWelcome)")

//  NOTE: all options you can use with string interpolation are described in String Interpolation

//  Use comments in Swift to include non-executable text in your code, as a note or reminder to yourself. Comments are ignored by the Swift compiler when your code is compiled.

//  this is a comment

/*
this
is
a
multiline
comment
*/


/*
this
is
a
/* nested multiline */
comment
*/

/*              Semicolons            */
/*————————————————————————————————————*/

//  Unlike many other languages, Swift does not require you to write a semicolon after each statement in your code, although you can do so if you wish
//  Semicolons are required however if you want to write multiple separate statements on a single line:

let cat = "🐱"; println(cat)


/*              Integers              */
/*————————————————————————————————————*/

/*  
Integers are whole numbers with no fractional component, such as 42 and -23. Integers are either signed (positive, zero, or negative) or unsigned (positive or zero).

Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms. These integers follow a naming convention similar to C, in that an 8-bit unsigned integer is of type UInt8, and a 32-bit signed integer is of type Int32. Like all types in swift, these integer types have capitalized names.
*/

let minValue = UInt8.min //minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max //maxValue is equal to 255, and is of type UInt8

let max64Value = UInt64.max //18446744073709551615

//  In most cases you don't need to pick a specific size of integer to use in your code. On a 32-bit platform, Int is the same size as Int32. On a 64-bit platform, Int is the same size as Int64

/* 
 Unless you need to work with a specific size of integer, always use Int for integer values in your code. This aids code consistency and interoperability. Even on 32-bit platforms, Int can store any value between -2,147,483,648 and 2,147,483,647, and is large enough for many integer ranges.
*/


/*      Floating-Point Numbers        */
/*————————————————————————————————————

Floating-point numbers are numbers with a fractional component, such as 3.14159, 0.1, and -273.15.
Double represents a 64-bit floating-point number. Use it when floating-point values must be very large or particularly precise.
Float represents a 32-bit floating-point number. Use it when floating-point values do not require 64-bit precision.
Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code.
*/



/*      Type Safety and Type Inference    */
/*————————————————————————————————————————————————————————————————
Swift is a type safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code expects a String, you can't pass an Int by mistake.

Swift performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.

 Type-checking helps you avoid errors when you’re working with different types of values. However, this doesn’t mean that you have to specify the type of every constant and variable that you declare. If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.

 Because of type inference, Swift requires far fewer type declarations than languages such as C or Objective-C. Constants and variables are still explicitly typed, but much of the work of specifying their type is done for you. 

 Type inference is particularly useful when you declare a constant or variable with an initial value. This is often done by assigning a literal value (or literal) to the constant or variable at the point that you declare it. (A literal value is a value that appears directly in your source code, such as 42 and 3.14159 in the examples below.)

*/

let meaningOfLife = 42

//  meaningOfLife is inferred to be of type Int
//  Likewise, if you don’t specify a type for a floating-point literal, Swift infers that you want to create a Double:

let pi = 3.14159
//  pi is inferred to be of type Double

/*
Swift always chooses Double (rather than Float) when inferring the type of floating-point numbers
If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context:
*/

let anotherPi = 3 + 0.14159
//  anotherPi is also inferred to be of type Double

// The literal value of 3 has no explicit type in and of itself, and so an appropriate output type of Double is inferred from the presence of a floating-point literal as part of the addition


/*  Numeric Literals
——————————————————————————————————————————————
Integer literals can be written as: 
  
- A decimal number, with no prefix
- A binary number, with a 0b prefix
- An octal number, with a 0o prefix
- A hexidecimal number, with a 0x prefix

All of these integer literals have a decimal value of 17
*/

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexidecimalInteger = 0x11

/*
Floating point literals can be decimal (with no prefix) or hexideciaml (with a 0x prefix). They must always have a number (or hexadecimal number) on both sides of the decimal point. They can also have an optional exponent, indicated by an uppercase or lowercase e for decimal floats, or an uppercase or lowercase p for hexadecimal floats.
*/

//  For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:
1.25e2 //means 1.25 × 102, or 125.0.
1.25e-2 //means 1.25 × 10-2, or 0.0125.

//  For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp: 
0xFp2 //means 15 × 22, or 60.0.
0xFp-2 //means 15 × 2-2, or 3.75.


//  All of these floating-point literals have a decimal value of 12.1875: 
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

/*
Numeric literals can contain extra formatting to make them easier to read. Both integers and floats can be padded with extra zeroes and can contain underscores to help with readability. Neither type of formatting affects the underlying value of the literal:
*/

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/*  Numeric Type Conversion
————————————————————————————————————————————————————————————
Use the Int type for all general-purpose integer constants and variables in your code, even if they are known to be non-negative. Using the default integer type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.
 Use other integer types only when they are specifically needed for the task at hand, because of explicitly-sized data from an external source, or for performance, memory usage, or other necessary optimization. Using explicitly-sized types in these situations helps to catch any accidental value overflows and implicitly documents the nature of the data being used.
*/







































































































































































































