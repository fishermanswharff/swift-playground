//: Playground - noun: a place where people can play

import UIKit

/* ========================================
 
            Control Flow

==========================================*/

//  swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code

//  swift also provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.

//  swift's switch statement is also considerably more powerful than its counterpart in my c-like languages. because the cases of a switch statement do not fall through to the next case in swift, it avoids common c errors  cause by missing break statements. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a switch case can be bound to temporary constants or variables for use within the case's body, and complex matching conditions can be expressed with a where clause for each case.



/* ——————————————————————————————————————————
 
                For-In Loops
 
 ———————————————————————————————————————— */

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}

//  if you don't need the value from a sequence, you can ignore the values by using an underscore in place of a variable name

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

//  The example above calculates the value of one number to the power of another (in this case, 3 to the power of 10). It multiplies a starting value of 1 (that is, 3 to the power of 0) by 3, ten times, using a closed range that starts with 1 and ends with 10. For this calculation, the individual counter values each time through the loop are unnecessary—the code simply executes the loop the correct number of times. The underscore character (_) used in place of a loop variable causes the individual values to be ignored and does not provide access to the current value during each iteration of the loop.

//  Use a for-in loop with an array to iterate over its items.

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
  print("Hello, \(name)!")
}


//  You can also iterate over a dictionary to access its key-value pairs. Each item in the dictionary is returned as a (key,value) tuple when the dictionary is iterated, and you can decompose the (key,value) tuple's members as explicitly named constants for use within the body of the for-in loop.

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
  print("\(animalName)s have \(legCount) legs")
}



/* ——————————————————————————————————————————

              While Loops

 ———————————————————————————————————————— */
//  a while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations is not known before the first iteration begins. Swift provides two kinds of while loops:

//  1: while evaluates its condition at the start of each pass through the loop
//  2: repeat-while evaluates its condition at the end of each pass through the loop

//  Snakes and ladders:

//  The rules of the game are as follows:

//  The board has 25 squares, and the aim is to land on or beyond square 25.
//  Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by the dotted arrow above.
//  If your turn ends at the bottom of a ladder, you move up that ladder.
//  If your turn ends at the head of a snake, you move down that snake.


/*
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

//  Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snake head have a negative number to move you back down the board.


board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
  // roll the dice
  diceRoll += 1
  if diceRoll == 7 { diceRoll = 1 }
  // move by the rolled amount
  square += diceRoll
  if square < board.count {
    // if we're still on the board, move up or down for a snake or a ladder
    square += board[square]
  }
}
print("Game over!")
*/





/* ——————————————————————————————————————————

              Repeat-While Loops

 ———————————————————————————————————————— */

//  The other variation of the while loop, known as the repeat-while loop, performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.

// *NOTE: The repeat-while loop in Swift is analogous to a do-while loop in other languages.

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

repeat {
  // move up or down for a snake or ladder
  square += board[square]
  // roll the dice
  diceRoll += 1
  if diceRoll == 7 { diceRoll = 1 }
  // move by the rolled amount
  square += diceRoll
} while square < finalSquare

print("Game over!")




/* ——————————————————————————————————————————

          Conditional Statements

 ———————————————————————————————————————— */

//  IF

//  in its simplest form the if statement has a single if condition.

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}

//  chain multiple if statements together to consider additional clauses

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


//  the final else clause is optional
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}

//  Because the temperature is neither too cold nor too warm to trigger the if or else if conditions, no message is printed.

/* ——————————————————————————————————————————

                  Switch

 ———————————————————————————————————————— */

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}
// Prints "e is a vowel"


//  No Implicit Fallthrough

//  in constrast with switch statements in C and Objective-C switch statements in swift do not fall through the bottom of each case and into the next one by deafult. instead the entire switch statement finishes its execution as soon as the first matching switch is completed, without requiring an explicit break statement. This makes switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.

//  * NOTE: Although break is not required in Swift, you can use a break statement to match and ignore a particular case or to break out of a matched case before that case has completed its execution. For details, see Break in a Switch Statement.

//  every switch case must contain an executable statement.


//  Interval Matching:
//  ———————————————————————

//  Values in switch cases can be checked for their inclusion in an interval. This example uses number intervals to provide a natural-language count for numbers of any size:

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
  naturalCount = "no"
case 1..<5:
  naturalCount = "a few"
case 5..<12:
  naturalCount = "several"
case 12..<100:
  naturalCount = "dozens of"
case 100..<1000:
  naturalCount = "hundreds of"
default:
  naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


/* ——————————————————————————————————————————

        Control Transfer Statements

 ———————————————————————————————————————— */


//  Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:

/*

continue
break
fallthrough
return
throw

*/

//  Continue
//  ———————————————

// The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration of the loop.

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
  switch character {
  case "a", "e", "i", "o", "u", " ":
    continue
  default:
    puzzleOutput.append(character)
  }
}
print(puzzleOutput)

//  Break
//  —————————————————

//  The break statement ends execution of an entire control flow statement immediately. The break statement can be used inside a switch statement or loop when you want to terminate execution of the switch or loop earlier than would otherwise be the case.

//  In a loop: When used inside a loop statement, break ends the loop’s execution immediately and transfers control to the first line of code after the loop’s closing brace (}). No further code from the current iteration of the loop is executed, and no further iterations of the loop are started.

//  In Switch: When used inside a switch statement, break causes the switch statement to end its execution immediately and to transfer control to the first line of code after the switch statement’s closing brace (}).

let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
  possibleIntegerValue = 1
case "2", "٢", "二", "๒":
  possibleIntegerValue = 2
case "3", "٣", "三", "๓":
  possibleIntegerValue = 3
case "4", "٤", "四", "๔":
  possibleIntegerValue = 4
default:
  break
}
if let integerValue = possibleIntegerValue {
  print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
  print("An integer value could not be found for \(numberSymbol).")
}


//  Fallthrough
//  Switch statements in Swift don’t fall through the bottom of each case and into the next one. Instead, the entire switch statement completes its execution as soon as the first matching case is completed. By contrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough. Avoiding default fallthrough means that Swift switch statements are much more concise and predictable than their counterparts in C, and thus they avoid executing multiple switch cases by mistake.

//  If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword. The example below uses fallthrough to create a textual description of a number.

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough
default:
  description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."




























