//: # Tuple example
//: Setting up and accessing a 3 variable tuple
var tup = (age:23, name:"Bill", female:false)
tup.age
tup.female

//: Array of tuples
var tupArray = [ (age:23, name:"Bill", female:false),
    (age:72, name:"Jane", female:true),
    (age:45, name:"Evonne", female:true) ]

tupArray.append((age: 42, name: "Jack", female: false))
//: Iterating over the array
for item in tupArray {
    var gender = "female"
    if !item.female {gender = "male"}
      print( "\(item.name) is \(item.age) and is \(gender)")
}






