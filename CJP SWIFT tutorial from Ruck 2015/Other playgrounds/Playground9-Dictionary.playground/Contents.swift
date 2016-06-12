
var pets = [ "Dave": "Goldfish", "Chaz": "Dog", "Idris": "Guinea Pig"]
pets["Murphy"] = "Guinea Pig"   //Add Murphy to the list of pets
pets.isEmpty  // returns false
pets.count    // returns 4

// Next two lines are an approximate truth - actually return an optional
pets["Murphy"]       // returns "Guinea Pig"
pets["Dog"]          // returns nil
pets["Chaz"] = "Bad Dog"    // updates entry for Chaz
for (name, animal) in pets {
    println( "\(name) is a \(animal)" )
}

pets["Idris"] = nil   // Deletes Idris from the dictionary
for name in pets.keys {
    println( "\(name) is a pet" )
}
for animal in pets.values {
    println( "We have a \(animal)" )
}
let petNames = [String](pets.keys)  // Makes an array from the keys.
