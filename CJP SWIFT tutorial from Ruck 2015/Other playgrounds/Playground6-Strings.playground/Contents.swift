
var greeting = "Hello"

var politeGreeeting = greeting + ", my friend"

var emptyString = ""


for char in ["a", "b", "c"] {
    emptyString += char
}
emptyString.isEmpty

emptyString = ""
emptyString.isEmpty

politeGreeeting.hasPrefix("friend")
politeGreeeting.hasSuffix("end")
//politeGreeeting.removeRange(Range(11, 11))

"aardvark" == "penguin"

"aardvark" == "aard" + "vark"

"aardvark" < "penguin"

"quail" < "penguin"

"penguin" <= "penguin"

var animal = "aardvark"

let a: Character = "a"
for char in animal {
    if char == a {
        print("Found an 'a'" )
    }
}

count(animal)


"Boiling point of water is \(100*1.8+32) fahrenheit"
