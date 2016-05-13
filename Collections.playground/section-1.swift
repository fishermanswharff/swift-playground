// Playground - noun: a place where people can play

import UIKit

/* ================================================================================

                                Collection Types

 ================================================================================  */
//  Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.

//  Arrays are ordered collections of values, Sets are unordered collections of unique values, Dictionaries are unordered collections of key-value associations.

//  Arrays, sets, and dictionaries in Swift are always clear about the types of values and keys that they can store. This means that you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.


/* ——————————————————————————————————————————————————————————————————————————————————

                            Mutability of Collections

 —————————————————————————————————————————————————————————————————————————————————— */
//  If you create an array, a set, or a dictionary, and assign it to a variable, the collection that is created will be mutable. This means you can change (or mutate) the collection after it is created by adding, removing, or changing items in the collection. If you assign an array, a set, or a dictionary to a constant, that collection is immutable, and its size and contents cannot be changed.


//  *NOTE: it is good practice to create immutable collections in cases where the collection does not need to change. Doing so enables the Swift compiler to optimize the performance of the collections you create.

/* ——————————————————————————————————————————————————————————————————————————————————

                                      Arrays

 —————————————————————————————————————————————————————————————————————————————————— */
//  Creating an empty array using the initializer syntax:
//  ———————————————————————————————————————————————————
var someInts = [Int]()
print("someINts is of type [Int] with \(someInts.count) items.")

//  alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as []

someInts.append(3)
someInts = []

//  Creating an array with a default value
//  —————————————————————————————————————————

//  swift's array type also provides an initializer for creating an array of a certain size with all of its values set to the same default value. You pass this initializer the number of items to be added to the new array (called count) and a default value of the appropriate type (called repeatedValue)

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

//  Creating an array by adding two arrays together
//  ————————————————————————————————————————————

var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

//  Array literals: you can initialize an array with an array literal, which is a shorthand way to write one or more values as an array collection.
var shoppingList: [String] = ["Eggs","Milk"]

//  because this particular array has specified a value type of String, it is only allowed to store String values. 

//  Thanks to Swift's type inference, you don't have to write the type of the array if you're initializing it with an array literal containing the values of the same type. You could initialize the shoppingList array in a shorter form instead:

var newShoppingList = ["Eggs","Milk"]

//  Accessing and modifying arrays
//————————————————————————————————

//  to find out the number of items in an array, check its read-only count property:

print("The shopping list contains \(shoppingList.count) items")

//  use the boolean isEmpty property as a shortcut for checking whether the count property is equal to 0

if shoppingList.isEmpty {
  print("The shopping list is empty")
} else {
  print("The shopping list is not empty")
}

//  you can add a new item to the end of an array by calling the array's append method

shoppingList.append("Flour")

print("\(shoppingList.count)")

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

//  If you try to access or modify a value for an index that is outside of an array’s existing bounds, you will trigger a runtime error. You can check that an index is valid before using it by comparing it to the array’s count property. Except when count is 0 (meaning the array is empty), the largest valid index in an array will always be count - 1, because arrays are indexed from zero.

//  Iterating over an array
//————————————————————————————

for item in shoppingList {
  print(item)
}

//  if you need the integer index of each item as well as its value, use the global enumerate function to iterate over the array instead. The enumerate function returns a tuple for each item in the array composed of the index and value for that item. You can decompose the tuple into temporary constants or variables as part of the iteration:

for (index, value) in shoppingList.enumerate() {
  print("Item \(index + 1): \(value)")
}

for (index, value) in shoppingList.enumerate() {
  print("Item \(index + 1): \(value)")
}

/* ——————————————————————————————————————————————————————————————————————————————————

                                      Sets

 —————————————————————————————————————————————————————————————————————————————————— */
//  A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

//  Hash Values for Set Types
//  ———————————————————————————————————

//  A type must be hashable in order to be stored in a set, that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue. All of swift's basic types (such as string, Int, Double, and Bool) are hashable by default, and can be used as set value types for dictionary key types. Enumeration case values without associated values are also hashable by default.


//  Set type syntax

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

//  Alternatively, if the context already provides type information, such as a function argument or an already typed variable

letters.insert("a")
letters
letters = []
letters


//  You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

//  The favoriteGenres set is declared as a variable (with the var introducer) and not a constant (with the let introducer) because items are added and removed in the examples below.

//  the set type cannot be inferred from an array literal alone, so the Set must be explicitly declared. However, because of Swift's type inference, you don't have to write the type of the set if you're initializing with a literal:

// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]



//  Accessing and modifying a set
//  ——————————————————————————————————————————

// read-only count property
print("I have \(favoriteGenres.count) favorite music genres.")

//  Boolean isEmpty property as a shortcut for checking whether the count is equal to 0

if favoriteGenres.isEmpty {
  print("As far as music goes, I'm not picky")
} else {
  print("I have particular music preferences")
}

//  you can add a new item into a set by calling the set's insert method:

favoriteGenres.insert("Jazz")
favoriteGenres.insert("Blues")

//  You can remove an item from a set by calling the set's remove(_:) method, which removes the item if it's a member, and returns the removed value, or returns nil if the set did not contain it. Alternatively, you can use the removeAll() method to empty the set out.

if let removedGenre = favoriteGenres.remove("Rock") {
  print("\(removedGenre)? I'm over it")
} else {
  print("I never much cared for that.")
}

//  to check whether a set contains a particular item, use the contains(_:) method.

if favoriteGenres.contains("Funk") {
  print("I get up on the good foot")
} else {
  print("It's too funky in here")
}

//  Iterating over a set

for genre in favoriteGenres {
  print("\(genre)")
}

//  a set does not have defined ordering. to iterate over the values in a specific order, use the sort() method, which returns the set's elements as an array sorted using the < operator.

for genre in favoriteGenres.sort() {
  print("\(genre)")
}

//  Performing set operations
//  ———————————————————————————————————————————

//  use the intersect(_:) method to create a new set with only values common to both sets
//  use the exclusiveOr(_:) method to create a new set with values in either set, but not both
//  use the union(_:) method to createa  new set with all of the values in both sets
//  use the subtract(_:) method to createe a new set with values not in the specified set

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

//  Set membership and equality
//  ————————————————————————————

//  use the is equal operator (==) to determine whether two sets contain all of the same values
//  use the isSubsetOf(_:) method to determine whether all of the values of a set are contained in the specified set.
//  use the isSupersetOf(_:) method to determine whether a set contains all of the values in a specified set.
//  use isStrictSupersetOf(_:) or isStrictSubsetOf(_:) to determine whether a set is a subset or superset, but not equal to, a specified set.
//  use isDisjoinWith(_:) method to determine whether two sets have any values in common.

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)



/* ——————————————————————————————————————————————————————————————————————————————————

                                  Dictionaries

 —————————————————————————————————————————————————————————————————————————————————— */
//  A dictionary is a container that stores multiple values of the same type. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.

//  Swift dictionaries are specific about the types of keys and values they can store.

//  The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys

//  You can also write the type of a dictionary in shorthand form as [Key: Value]. Although the two forms are functionally identical, the shorthand form is preferred, and is used throughout this guide when referring to the type of a dictionary.

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//  as with arrays you don't have to write the type of the dictionary if you're initializing it with a dictionary literal whose keys and values have consistent types. could have been written in shorthand, like so: 

var newAirports = ["YYZ":"Toronto Pearson","DUB":"Dublin"]


//  Accessing and modifying a dictionary
//———————————————————————————————————————

print("The airports dictionary contains \(airports.count) items")

//  Use the boolean isEmpty property to check whether the count property is equal to 0

if airports.isEmpty {
  print("The airports dictionary is empty")
} else {
  print("The airports dictionary is not empty")
}


//  You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type.

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

//  As an alternative to subscripting, use a dictionary's updateValue(forKey:) method to set or update the value for a particular key. 

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
  print("The name of the airport is \(airportName)")
} else {
  print("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple International"
//  "Apple International" is no the real airport for APL, so delete it
airports["APL"] = nil

//  alternatively use the removeValueForKey method to remove key value pairs

if let removedValue = airports.removeValueForKey("DUB") {
  print("The removed airport's name is \(removedValue)")
} else {
  print("The airports dictionary does not contain a value for DUB")
}



//  Iterating over a dictionary
//——————————————————————————————————

for(airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}

//  you can also retrieve an iterable collection of a dictionary's keys or values by accessing its keys and values properties

for airportCode in airports.keys {
  print("Airport code: \(airportCode)")
}

for airportName in airports.values {
  print("Airport name: \(airportName)")
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






























































