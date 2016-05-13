// Playground - noun: a place where people can play

import UIKit



/* ========================================================================================================
 
                                                STRINGS AND CHARACTERS
 
 ======================================================================================================== */

//—————————————————————————————————————————————————————————————————————————

//  A string is an ordered collection of characters. 



/* ————————————————————————————————————————————————————————————————————————

                              String literals
 
 ———————————————————————————————————————————————————————————————————————— */

let someString = "Some string literal value"

//  You can include predefined String values within your code as string literals. A string literal is a fixed sequence of textual characters surrounded by a pair of double quotes ("")



/* ————————————————————————————————————————————————————————————————————————

                      Initializing an empty string

 ———————————————————————————————————————————————————————————————————————— */

var emptyString = "" // empty string syntax
var anotherEmptyString = String() // initializer syntax

//  these two strings are both empty and are equivalent to each other

if emptyString.isEmpty {
  print("Nothing to see here")
}


/* ————————————————————————————————————————————————————————————————————————

                        String mutability

 ———————————————————————————————————————————————————————————————————————— */

//  You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified) or to a constant (in which case it cannot be modified)

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander"
//  the above reports a compile time error because constants cannot be changed.



/* ————————————————————————————————————————————————————————————————————————

                      Strings are value types

 ———————————————————————————————————————————————————————————————————————— */


//  Swift's String type is a value type. If you create a new String value, that String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable. In each case, a new copy of the existing string value is created, and the new copy is passed or assigned, not the original version.


/* ————————————————————————————————————————————————————————————————————————

                        Working with characters

 ———————————————————————————————————————————————————————————————————————— */
//  Swift's String type represents a collection of Character values in a specified order. You can access the individual Character values in a string by iterating over that string's characters property with a for-in loop

for character in "Dog!🐶".characters {
  print(character)
}

//  alternatively, create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation: 

let yenSign: Character = "¥"

//  STring values can be constructed by passing an array of character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)




/* ————————————————————————————————————————————————————————————————————————

                  Concatenating Strings and Characters

 ———————————————————————————————————————————————————————————————————————— */

let string1 = "hello"
let string2 = " there"

var welcome = string1 + string2

//  String values can be added together (or concatenated) with the addition operator (+) to create a new String value.


//  You can also append Strings with the addition assignment operator

var instruction = "look over"
instruction += string2

//  you can append a Character value to a String variable with the String type's append method

let exclamationMark: Character = "!"
welcome.append(exclamationMark)

//  You can't append a String or Character to an existing Character variable because a Character value must contain a single character only



/* ————————————————————————————————————————————————————————————————————————

 section name

 ———————————————————————————————————————————————————————————————————————— */

//  String interpolation
//——————————————————————

//  String interpolation is a way to construct a new String value from a mix of constants, variables, and expressions by including their values inside a string literal. You do this inside a string with the backslash and parentheses: "\()"

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


/* ————————————————————————————————————————————————————————————————————————

 section name

 ———————————————————————————————————————————————————————————————————————— */

//  Unicode
//—————————————

//  Unicdoe is an international standard for encoding, representing and processing text in different writing systems.

//  String literals can include the following special Unicode characters:

//  The escaped special characters \0 (null character)
//  \\ (backslash)
//  \t (horizontal tab)
//  \n (line feed)
//  \r (carriage return)
//  \" (double quote)
//  \' (single quote)
//  An arbitrary Unicode scalar, written as \u{n}, where n is between one and eight hexidecimal digits

let wiseWords = "\"Imagination is more important thatn knowledge\" - Einstein"

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")

word += "\u{301}"

print("the number of characters in \(word) is \(word.characters.count)")



/* ————————————————————————————————————————————————————————————————————————

                                  Comparing Strings

 ———————————————————————————————————————————————————————————————————————— */
//  String and character equality is checked with the "equal to" operator (==) and the "not equal to" operator (!=), as described in Comparison Operators:

let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I"

if quotation == sameQuotation {
  print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vouz un caf\u{65}\u{301}"
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCaptialLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCaptialLetterA {
  print("These two characters are not equivalent")
}

let romeoAndJuliet = [
  "Act 1 Scene 1: Verona, A public place",
  "Act 1 Scene 2: Capulet's mansion",
  "Act 1 Scene 3: A room in Capulet's mansion",
  "Act 1 Scene 4: A street outside Capulet's mansion",
  "Act 1 Scene 5: The Great Hall in Capulet's mansion",
  "Act 2 Scene 1: Outside Capulet's mansion",
  "Act 2 Scene 2: Capulet's orchard",
  "Act 2 Scene 3: Outside Friar Lawrence's cell",
  "Act 2 Scene 4: A street in Verona",
  "Act 2 Scene 5: Capulet's mansion",
  "Act 2 Scene 6: Friar Lawrence's cell"
]

//  You can use the hasPrefix methods with the romeoAndJuliet array to count the number of scenes in Act 1 of the play

var act1SceneCount = 0
for scene in romeoAndJuliet {
  if scene.hasPrefix("Act 1 ") {
    act1SceneCount += 1
  }
}

print("There are \(act1SceneCount) scenes in Act 1")

//  use the hasSuffix method to count the number of scenes that take place in or around Capulet's mansion and Friar Lawrence's cell:

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
  if scene.hasSuffix("Capulet's mansion") {
    mansionCount += 1
  } else if scene.hasSuffix("Friar Lawrence's cell"){
    cellCount += 1
  }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")






































