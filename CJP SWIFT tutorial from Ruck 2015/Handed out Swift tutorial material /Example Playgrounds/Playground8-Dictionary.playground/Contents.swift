//: # A Playground exploring dictionaries

//:Setting up a dictionary as such
var pets = [ "Dave": "Goldfish", "Chaz": "Dog", "Idris": "Guinea Pig"]
pets["Murphy"] = "Guinea Pig"   //Add Murphy to the list of pets
pets.isEmpty  // returns false
pets.count    // returns 4

// Next two lines are an approximate truth - actually return an optional
var ans1 = pets["Murphy"]       // returns "Guinea Pig"
ans1 = pets["Dog"]          // returns nil
pets["Chaz"] = "Bad Dog"    // updates entry for Chaz
//: Iterating the over the dictionary
for (name, animal) in pets {
    print( "\(name) is a \(animal)" )
}
print("=================")

pets["Idris"] = nil   // Deletes Idris from the dictionary

for name in pets.keys {
    print( "\(name) is a pet" )
}
print("=================")
for animal in pets.values {
    print( "We have a \(animal)" )
}

let petNames = [String](pets.values)  // Makes an array from the keys.
