
var tup = (age:23, name:"Bill", female:false)
tup.age
tup.female

var tupArray = [ (age:23, name:"Bill", female:false),
    (age:72, name:"Jane", female:true),
    (age:45, name:"Evonne", female:true) ]

tupArray.append(age: 42, name: "Jack", female: false) // Don't need 2 bracket sets


for item in tupArray {
    var gender = "female"
    if !item.female {gender = "male"}
    println( "\(item.name) is \(item.age) and is \(gender)")
}

var x = [ "Bill": "Ben",  "Pinky": "Perky"]
x["Bill"]




