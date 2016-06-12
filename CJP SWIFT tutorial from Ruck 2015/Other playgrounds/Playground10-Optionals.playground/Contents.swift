//: Playground - noun: a place where people can play

import UIKit

var pets = [ "Dave": "Goldfish", "Chaz": "Dog", "Idris": "Guinea Pig"]
pets["Murphy"] = "Guinea Pig"   //Add Murphy to the list of pets

var animalRef: String? = pets["Murphy"]

println(animalRef == nil)

// Force unwrapping
if (animalRef != nil) {println( animalRef!) }
else { println( "Animal Unknown" ) }

// Better unwrapping
if let animal = animalRef { println(animal) }
else { println( "Animal Unknown") }

animalRef = pets["Dog"]
var animalRef2 = pets["Cat"]

if let animal = animalRef, let animal2 = animalRef2 { println(animal, animal2)
}
else { println( "Animals Unknown") }

animalRef = pets["Chaz"]
animalRef2 = pets["Murphy"]

if let animal = animalRef, let animal2 = animalRef2 { println(animal, animal2)
}
else { println( "Animals Unknown") }


