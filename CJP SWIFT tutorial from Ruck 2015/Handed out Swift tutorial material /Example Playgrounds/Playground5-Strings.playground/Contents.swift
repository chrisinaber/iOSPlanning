//: # A playground exploring `Strings`

//: 3 definitions of strings
var greeting = "Hello"

var politeGreeeting = greeting + ", my friend"

var emptyString = ""


for char in ["a", "b", "c"] {
    emptyString += char
}
//: Some functions of `String`
emptyString.isEmpty

emptyString = ""
emptyString.isEmpty

politeGreeeting.hasPrefix("friend")
politeGreeeting.hasSuffix("end")

//: `String` comparison
"aardvark" == "penguin"

"aardvark" == "aard" + "vark"

"aardvark" < "penguin"

"quail" < "penguin"

"penguin" <= "penguin"

var animal = "aardvark"

let a: Character = "a"
for char in animal.characters {
    if char == a {
        print("Found an 'a'" )
    }
}

animal.characters.count

"Boiling point of water is \(100*1.8+32) fahrenheit"
