//: # Arrays playground
//: Creating the array, adding elements and counting elements
var myPets: [String]  =  []
var pets = [String]()  // different way of doing the same thing
myPets.count
myPets.append( "Chaz the Dog" )
myPets.append( "Dave the Goldfish" )
myPets.count
//: Combining arrays
let yourPets = [ "Idris the Guinea Pig"]
var ourPets = myPets + yourPets
ourPets.count
//: Removing selected elements
ourPets[0] = "Chaz the Bad Dog"
let deadPet = ourPets.removeAtIndex(2)
ourPets
deadPet
//: Inserting an element into a specific place
ourPets.insert( "Bob the Capybara", atIndex: 0)
//: Iterating over the array
for pet in ourPets {
    print(pet)
}

// Initialized fixed size with default values
var readings = [Double](count:200, repeatedValue: 0.0)
readings.removeLast()
readings.count





