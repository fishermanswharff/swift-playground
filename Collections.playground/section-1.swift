// Playground - noun: a place where people can play

import UIKit

//  Collection Types
//—————————————————————

//  Swift provides two collection types, known as arrays and dictionaries, for storing collections of values.

//  Arrays and dictionaries in Swift are always clear about the types of values and keys that they can store. This means you cannot insert a value of the wrong type into an array or dictionary by mistake. It also means you can be confident about the types of values you will retrieve from an array or dictionary. 


//====================================================
//                      Arrays
//====================================================

//  Array literals: you can initialize an array with an array literal, which is a shorthand way to write one or more values as an array collection.

var shoppingList: [String] = ["Eggs","Milk"]

//  because this particular array has specified a value type of String, it is only allowed to store String values. 

//  Thanks to Swift's type inference, you don't have to write the type of the array if you're initializing it with an array literal containing the values of the same type. You could initialize the shoppingList array in a shorter form instead:

var newShoppingList = ["Eggs","Milk"]

//  Accessing and modifying arrays
//————————————————————————————————

//  to find out the number of items in an array, check its read-only count property:

println("The shopping list contains \(shoppingList.count) items")

//  use the boolean isEmpty property as a shortcut for checking whether the count property is equal to 0

if shoppingList.isEmpty {
  println("The shopping list is empty")
} else {
  println("The shopping list is not empty")
}

//  you can add a new item to the end of an array by calling the array's append method

shoppingList.append("Flour")

println("\(shoppingList.count)")

//  alternatively, append an array of one or more compatible items with the addition assignment operator (+=)

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread","Cheese","Butter"]

//  retrieve a value from the array by using subscript syntax, passing the index of the value you want to retrieve within the square brackets immediately after the name of the array

var firstItem = shoppingList[0]

//  arrays are zero-indexed

//  you can use subscript syntax to change an existing value at a given index:

shoppingList[0] = "Six Eggs"

//  you can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing. 

shoppingList[4...6] = ["Bananas","Apples"]

//  to insert an item into the array at a specified index, call the array's insert(atIndex:) method

shoppingList.insert("Maple Syrup", atIndex: 0)

//  remove an item from the array with the removeAtIndex method. This method removes the item at the index and returns that value

let mapleSyrup = shoppingList.removeAtIndex(0)

//  any gaps in an array are closed when an item is removed, and so the value at index 0 is once again equal to "Six Eggs"

firstItem = shoppingList[0]

//  if you want to remove the final item from an array, use the removeLast method rather than the removeAtIndex method to avoid the need to query the array's count property. 

let apples = shoppingList.removeLast()



//  Iterating over an array
//————————————————————————————

for item in shoppingList {
  println(item)
}

//  if you need the integer index of each item as well as its value, use the global enumerate function to iterate over the array instead. The enumerate function returns a tuple for each item in the array composed of the index and value for that item. You can decompose the tuple into temporary constants or variables as part of the iteration:

for (index, value) in enumerate(shoppingList) {
  println("Item \(index + 1): \(value)")
}

//  Creating and initializing an Array
//———————————————————————————————————————
var someInts = [Int]()
println("someInts is of type [Int] with \(someInts.count)")

someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

//  you can create a new array by adding together two existing arrays of compatible type with the addition operator (+)

var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles


//—————————————————————————————————————————————————————————————————————————




//====================================================
//                      Dictionaries
//====================================================

//  A dictionary is a container that stores multiple values of the same type. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.

//  Swift dictionaries are specific about the types of keys and values they can store.

//  The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys

//  You can also write the type of a dictionary in shorthand form as [Key: Value]. Although the two forms are functionally identical, the shorthand form is preferred, and is used throughout this guide when referring to the type of a dictionary.

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//  as with arrays you don't have to write the type of the dictionary if you're initializing it with a dictionary literal whose keys and values have consistent types. could have been written in shorthand, like so: 

var newAirports = ["YYZ":"Toronto Pearson","DUB":"Dublin"]


//  Accessing and modifying a dictionary
//———————————————————————————————————————

println("The airports dictionary contains \(airports.count) items")

//  Use the boolean isEmpty property to check whether the count property is equal to 0

if airports.isEmpty {
  println("The airports dictionary is empty")
} else {
  println("The airports dictionary is not empty")
}


//  You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type.

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

//  As an alternative to subscripting, use a dictionary's updateValue(forKey:) method to set or update the value for a particular key. 

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  println("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
  println("The name of the airport is \(airportName)")
} else {
  println("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple International"
//  "Apple International" is no the real airport for APL, so delete it
airports["APL"] = nil

//  alternatively use the removeValueForKey method to remove key value pairs

if let removedValue = airports.removeValueForKey("DUB") {
  println("The removed airport's name is \(removedValue)")
} else {
  println("The airports dictionary does not contain a value for DUB")
}



//  Iterating over a dictionary
//——————————————————————————————————

for(airportCode, airportName) in airports {
  println("\(airportCode): \(airportName)")
}

//  you can also retrieve an iterable collection of a dictionary's keys or values by accessing its keys and values properties

for airportCode in airports.keys {
  println("Airport code: \(airportCode)")
}

for airportName in airports.values {
  println("Airport name: \(airportName)")
}

//  if you need to use a dictionary's keys or values with an API that takes an array instance, initialize a new array with the keys or values property

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//  Dictionaries are unordered collections in Swift. The order is not specified

//  Creating an empty dictionary
//——————————————————————————————

var namesOfIntegers = [Int: String]()

//  if the context already provides type information you can create an empty dictionary literal, which is written as [:] 

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//  Hash values for dictionary key types
//——————————————————————————————————————
//  A type must be hashable in order to be used as a dictionary's key type—that is, the type must provide a way to computer a hash value for itself. A hash value is an Int value that is the same for all objects that compare equal, such that if a == b, it follows that a.hashValue == b.hashValue

//  All of swift's basic types such as String, Int, Double, and Bool are hashable by default. 






























































