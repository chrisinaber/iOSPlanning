//: Optionals Playground - a brief overview of optionals

import UIKit
//: Let's set up some variables.
var pets = [ "Dave": "Goldfish", "Chaz": "Dog", "Idris": "Guinea Pig"]
pets["Murphy"] = "Guinea Pig"   //Add Murphy to the list of pets

pets

//: When you access the dictionary, you get an optional - try deleting the "?"
var animalRef: String? = pets["Murphy"]

animalRef = pets[ "Dave" ]

//: Force unwrapping
if (animalRef != nil) { "Dave is a \(animalRef!)" }
else { "Dave is an unknown animal"  }

//: You have to do the test or risk crashing and dying - see by uncommenting the following

let missingRef = pets["Bill"]
//"Bill is a \(missingRef!)"


//: Better unwrapping using "if let" to test and assign.  This also works for nil
if let animal = animalRef {  "Dave is a \(animal)" }
else { "Dave is an unknown animal" }

if let missing = missingRef {  "Bill is a \(missing)" }
else { "Dave is an unknown animal" }


//:  You can assign multiple optionals in one statement
var animalRef1 = pets["Dog"]
var animalRef2 = pets["Cat"]

if let animal1 = animalRef1, let animal2 = animalRef2 { "Animals are \(animal1) and \(animal2)"
}
else { "Animals are unknown" }

//: Now the key of the dictionary
animalRef1 = pets["Chaz"]
animalRef2 = pets["Murphy"]

if let animal1 = animalRef1, let animal2 = animalRef2 { "Animals are \(animal1) and \(animal2)"
}
else { "Animals are unknown" }


