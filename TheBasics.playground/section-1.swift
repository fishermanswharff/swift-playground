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

/* ————————————————————————————————————————————————————————————————
 
                    Constants and Variables
 
 ———————————————————————————————————————————————————————————————— */

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

//  You can print the current value of a constant or variable with print function

print(friendlyWelcome)


//  the print(_:separator:terminator:) function is a global function that prints one or more values ot an appropriate output. In Xcode for example, the print(_:separator:terminator:) function prints its output in Xcode's "console" panel. The separator and terminator parameter have default values, so you can omit them when you call this function. by default, the function terminates the line it prints by adding a line break. To print a value without a line break after it, pass an empty string as the terminator, for example:

print("Hello World", terminator: "")

//  Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable. Wrap the name in parentheses and escape it with a backslash before the opening parenthesis:

print("The current value of friendlyWelcome is \(friendlyWelcome)")

//  NOTE: all options you can use with string interpolation are described in String Interpolation


/* ————————————————————————————————————————————————————————————————

                        Comments
 
———————————————————————————————————————————————————————————————— */

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

/* ————————————————————————————————————————————————————————————————
 
                                Semicolons
 
 ———————————————————————————————————————————————————————————————— */

//  Unlike many other languages, Swift does not require you to write a semicolon after each statement in your code, although you can do so if you wish

//  Semicolons are required however if you want to write multiple separate statements on a single line:

let cat = "🐱"; print(cat)

/* ————————————————————————————————————————————————————————————————
 
                                Integers
 
 ———————————————————————————————————————————————————————————————— */

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



/* ————————————————————————————————————————————————————————————————
 
                    Floating-Point Numbers
 
 ———————————————————————————————————————————————————————————————— */

/*
 Floating-point numbers are numbers with a fractional component, such as 3.14159, 0.1, and -273.15.
 Double represents a 64-bit floating-point number. Use it when floating-point values must be very large or particularly precise.
 Float represents a 32-bit floating-point number. Use it when floating-point values do not require 64-bit precision.
 Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code.
*/



/* ————————————————————————————————————————————————————————————————
 
                    Type Safety and Type Inference
 
 ———————————————————————————————————————————————————————————————— */

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

/* ————————————————————————————————————————————————————————————————
 
                            Numeric Literals
 
 ———————————————————————————————————————————————————————————————— */

/*
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

/* ————————————————————————————————————————————————————————————————
 
                    Numeric Type Conversion
 
 ———————————————————————————————————————————————————————————————— */

/*
Use the Int type for all general-purpose integer constants and variables in your code, even if they are known to be non-negative. Using the default integer type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.
 Use other integer types only when they are specifically needed for the task at hand, because of explicitly-sized data from an external source, or for performance, memory usage, or other necessary optimization. Using explicitly-sized types in these situations helps to catch any accidental value overflows and implicitly documents the nature of the data being used.
*/


/* ————————————————————————————————————————————————————————————————
 
                        Integer Conversion
 
 ———————————————————————————————————————————————————————————————— */
/*
 The range of numbers that can be stored in an integer constant or variable is different for each numeric type. An Int8 constant or variable can store numbers between -128 and 127, whereas a UInt8 constant or variable can store numbers between 0 and 255. A number that will not fit into a constant or variable of a sized integer type is reported as an error when your code is compiled:

*/

//let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
//let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value, and so this will also report an error

/* Because each numeric type can store a different range of values, you must opt in to numeric type conversion on a case-by-case basis. This opt-in approach prevents hidden conversion errors and helps make type conversion intentions explicit in your code. To convert one specific number type to another, you initialize a new number of the desired type with the existing value. In the example below, the constant twoThousand is of type UInt16, whereas the constant one is of type UInt8. They cannot be added together directly, because they are not of the same type. Instead, this example calls UInt16(one) to create a new UInt16 initialized with the value of one, and uses this value in place of the original:  */

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


/* ————————————————————————————————————————————————————————————————
 
                Integer and Floating-Point Conversion
 
 ———————————————————————————————————————————————————————————————— */

// Conversions between integer and floating-point numeric types must be made explicit:  
let three = 3
let oneFourOneFiveNine = 0.14159
let new_pi = Double(three) + oneFourOneFiveNine

// Here, the value of the constant three is used to create a new value of type Double, so that both sides of the addition are of the same type. Without this conversion in place, the addition would not be allowed.

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int


/* ————————————————————————————————————————————————————————————————
 
                            Type Aliases
 
 ———————————————————————————————————————————————————————————————— */


/*
Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
 Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source:
*/

typealias AudioSample = UInt16

//  Once you define a type alias, you can use the alias anywhere you might use the original name: 

var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

//  Here, AudioSample is defined as an alias for UInt16. Because it is an alias, the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable.


/* ————————————————————————————————————————————————————————————————
 
                            Booleans
 
 ———————————————————————————————————————————————————————————————— */


/*
 Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false:
*/

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
  print("Mmm, tasty turnips!")
} else {
  print("Eww, turnips are horrible.")
}

//  conditional statements such as the if statement are covered in more detail in Control flow

//  Swift's type safety prevents non-Boolean values from being substituted for Bool. The following example reports a compile-time error:



//  this example will not compile, but report an error
//let i = 1
//if i {
//
//}

//  however, the alternative example below is valid:

let i = 1
if i == 1 {
  print("one is the lonliest number")
}
//  The result of the i == 1 comparison is type Bool


/* ————————————————————————————————————————————————————————————————
 
                                Tuples
 
 ———————————————————————————————————————————————————————————————— */

/*
Tuples gropu multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.  In this example, (404, "Not Found") is a tuple that describes an HTTP status code.
*/

let http404Error = (404, "Not Found")

// You can create tuples from any permutation of types, and they can contain as many different types as you like. 

//  You can decompose a tuple's contents into separate constants or variables, which you then access as usual:

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//   If you only need some of the tuple's values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:

let (justTheStatusCode,_) = http404Error
print("The status code is \(justTheStatusCode)")

//  Alternatively, access individual element values in a tuple using index numbers starting at zero:

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//  You can name the individual elements in a tuple when the tuple is defined

let http200Status = (statusCode: 200, description: "OK")

//  if you name the elements in a tuple, you can use the element names to access the values of those elements

print("Accessing tuple values by element names is easy, like so: \(http200Status.statusCode)")
print("Status code 200 means: \(http200Status.description)")

//  Tuples are particularly useful as the return value of functions. A functions that tries to retrieve a web page might return the (Int, String) tuple type to describe the success or failure of the page retrieval. By returning a tuple with two distinct values, each of a different type, the function provides more useful information about its outcome than if it could only return a single value of a single type.

/* ————————————————————————————————————————————————————————————————
 
                            Optionals
 
 ———————————————————————————————————————————————————————————————— */
/*
 You use optional in situations where a value may be absent. An optional says:

 There is a value, and it equals x

 or

 There isn't a value at all

 Here's an example of how optionals can be used to cope with the absence of a value.
*/

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//coverted number is inferred to be of type "Int?", or "optional Int"

/*  Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int. The question mark indicates that the value it contains is optional, meaning that it might contain some Int valu, or it might contain no value at all. (It can't contain anything else, such as a Bool or String. it's either an Int or nothing at all). */


/*  nil
———————————————————————————————————————————————————
  You set an optional variable to a valueless state by assigning it the special value nil:
*/

var serverResponseCode: Int? = 404
serverResponseCode = nil

//nil cannot be used with nonoptional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type. 

//  this also sets the initial value to nil:

var surveyAnswer: String?

print(surveyAnswer)



/*  If statements and forced unwrapping
———————————————————————————————————————————————————
You can use an if statement to find out whether an optional contains a value by comparing the optional against nil.
*/

if convertedNumber != nil {
  //  prints the line "convertedNumber contains some integer value: Optional(123)"
  print("convertedNumber contains some integer value: \(convertedNumber)")
  //  once you're sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark to the end of the optional's name. The exclamation mark effectively says, "I know that this optional contains a value, please use it." This is knows as forced unwrapping of the optional's value
  print("convertedNumber contains some integer value: \(convertedNumber!)")
}

/*  Optional Binding
—————————————————————————————————————————————————————
You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.
*/

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)", terminator: "")
} else {
  print("\"\(possibleNumber)\" could not be converted to an integer", terminator: "")
}

//  if the conversion is successful, the actualNumber constant becomes available for use within the first branch of the if statement. It has already been initialized with the value contained within the optional, and so there is no need to use the ! suffix to access its value. In this example, actualNumber is simply used to print the result of the conversion.

//  You can use both constants and variables with optional binding. If you wanted to manipulate the value of actualNumber within the first branch of the if statement, you could write if var actualNumber instaed, and the value contained within the optional would be made available as a variable rather than a constant.

//  You can include multiple optional bindings in a single if statement and use a where clause to check for a Boolean condition. If any of the values in the optional bindings are nil or the where clause evaluates to false, the whole optional binding is considered unsuccessful.

if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
  print("\(firstNumber) < \(secondNumber)", terminator: "")
}


//  NOTE: Constants and variables created with optional binding in an if statement are available only within the body of the if statement. In contrast, the constants and variables created with a guard statement are available in the lines of code that follow the guard statement, as described in Early Exit,



/*  Implicitly unwrapped optionals
—————————————————————————————————————————————————
sometimes it's clear from a program's structure that an optional will always have a value, after that value is first set. In these cases, it is useful to remove the need to check an unwrap the optional's value every time it is accessed, because it can be safely assumed to have a value all of the time. These kinds of optionals are defined as implicitly unwrapped optionals
*/

let possibleString: String? = "An optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String! = assumedString

//  if you try to access an implicitly unwrapped optional when it does not contain a value, you will trigger a runtime error. The result is exactly the same as if you place an exclamation mark after a normal optional that does not contain a value.


/* ———————————————————————————————————————————————————————
 
                    Error Handling
 
——————————————————————————————————————————————————————— */

//  You use error handling to respond to error conditions your program may encounter during execution. In constrast to optional, which can use the presence or absence of a value to communicate success or failure of a function, error handling allows you to determine the underlying cause of failure, and if necessary, propogate the error to another part of your program. When a function encounters an error condition it throws an error. That function's caller can then catch the error and respond appropriately.

func canThrowAnError() throws {
  // this function may or may not throw an error;
}

//  A function indicates that it can thro an error by including the throws keywork in its declaration. when you call a function that can throw an error, you prepend the try keyword to the expression.

//  Swift automatically propogates errors out of their current scope until they are handled by a catch clause.

do {
  try canThrowAnError()
  //  no error was thrown
} catch {
  // an error was thrown
}

//  A do statement creates a new containing scope, which allows errors to be propogated to one or more catch clauses.
//  Here's an example of how error handling can be used to respond to different error conditions:

/*
func makeASandwich() throws {

}

do {
  try makeASandwich()
  eatASandwich()
} catch Error.OutOfCleanDishes {
  washDishes()
} catch Error.MissingIngredients(let ingredients){
  buyGroceries(ingredients)
}
*/

/* ———————————————————————————————————————————————————————

                    Assertions

 ——————————————————————————————————————————————————————— */


/*
Optionals enable you to check for values that may or may not exist, and to write code that gracefully copes with the absence of values. In some cases however, it is simply not possible for your code to continue execution if a value does not exist, or if a provided value does not satisfy a certain condition.

an assertion is a runtime check that a logical condition definitely evaluates to true. Literally put, an assertion "asserts" that a condition is true.

If your code triggers an assertion while running in a debug environment, such as when you build and run an app in Xcode, you can see exactly where the invalid state occurred and query the state of your app at the time that the assertion was triggered. An assertion also lets you provide a suitable debug message as to the nature of the assert. 

 You write an assertion by calling the global assert function. You pass the assert function an expression that evaluates to true or false and a message that should be displayed if the result of the condition is false:
*/

let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
//  the above line causes the assertion to trigger, because age is not >= 0













































































































































