/*:
  [Previous](@previous) | [Contents](Content)

 # Functions
 This playground covers the topic of functions. There are some short activities, each with a number. Example answers can be found at the end of this page.
 
 A function has a name, an optional list of parameters and an optional return value. Functions can be written at a global level or within classes and structs. All functions start with the keyword func.
 
 The following example is a function that only includes the name.
 
 */

func aFunctionName() {
    print("The statements are inserted here")
}

//: To call the function defined above, use the following format.
aFunctionName()

//: A return value is specified after the parameter list. The symbol -> is used to separate the parameter list and the return type.
func getMeAStringValue() -> String {
    return "A string value as the result"
}

/*:
 ## Activity 1
 Write a statement that defines a constant that is initialised to the result from this method.
 */

// write your code here.

/*:
 
 # Parameters
 
 A parameter list contains parameter names, followed by a colon, followed by a type. If there are multiple parameter names, each parameter is separated by a comma.
 */

func add(int1: Int, int2: Int) -> Int {
    return int1 + int2
}

//: To call this method, we would write:
add(1, int2: 2)

/*:
 There is a difference here from what you might expect. Notice that the first parameter is presented as a value, whereas the second parameter needs a label before it. The int2: before the second parameter is **external name** for the second parameter. In Swift, all function parameters can have two names: an **external** and an **internal** name. In the add() method above, there are only internal names.
 
 By default, the parameter names are just internal to the method. Formally, they are local parameter names. However, in Swift 2, these internal names can also become the default external names that are used in method calls. In Swift 2, a method call does not require an external name for the first parameter, but it does for any other parameters. By default, the internal name becomes the external name. Thus, the method call above uses int2: as a prefix to the second parameter.
 
 Swift has a way to define a external name for a parameter that is used explain what the purpose of the parameter is. This can be done by adding another name before the local parameter name. For the above example, we could write:
 */

func add(numberOne int1: Int, numberTwo int2: Int) -> Int {
    return int1 + int2
}

/*: 
 ## Activity 2
 How do you think you would call this method? Try to call this, thinking about the use of the external parameter names.
 */

// write your code here

//: The external parameter names can add clarity to what is being passed. This is something that has come over from the Objective-C approach and the various Objective-C APIs. In Objective-C, a good method name would be something that could be read as a sentence. An example using the add method could be:

func add(number int1: Int, toOtherNumber int2: Int) -> Int {
    return int1 + int2
}

/*:
 ## Activity 3
 How would you call the above method? Type it in and try it.
 */

// write your code here
add(number: 10, toOtherNumber: 20)

//: ## Activity 4
//: How would you define a function add where the first parameter does not have an external name, but the other parameter does?

// write your code here

/*:
 You don't always have think of two different names. If you have a good local parameter name that is also useful as an external parameter name. As of Swift 2, you insert the name twice. You only need to do this for the first parameter, because the other parameters will automatically use the internal name as an external name.
 
 In Swift 1, you could use the # character before the name. You might see that online examples, but it is not part of Swift 2.
 */

func addExternalNameExample(doubleOne doubleOne: Double, doubleTwo: Double) -> Double {
    return doubleOne + doubleTwo
}

/*:
 ## Activity 5 
 
 How would you call this method with the values 10.5 and 20.1? Type it in an try it.
 
 */

// write your code here

/*:
 You will see examples of the external parameter names when working with the tableView methods. For example, you will see the following method call when we table about tables.
 
 tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
 
 Here, the first parameter does not use an external name but the second parameter does. The aim is to make this readable, so that you could read out 'table view dequeue reusable cell with identifier for index path' - which is a description of what should happen. As we talk about other parts of the API on this course, look at the methods you are using - it is common that the first parameter doesn't use an external name.
 
 
 ## Default Values
 Method parameters can also have default values. An example is shown below.
 */

func setName(forename f: String = "Unknown", surname s: String, initials i: String = "") {
    print("The values were \(f) \(i) \(s)")
}

/*:
 ## Activity 6
 
 Write code that calls the `setName()` method. How many ways can you call this method?
 
 */

// write your code here 

/*:
 - note: 
 The answers for the above activities are at the bottom of this page.
*/

/*: 
 # Tupels 
 If you have time, you could have a look at a the use of Tuples to provide a convienent way to have a simple, unnamed, data type that can be used to represent a related group of values. This makes it possible to return more than one value from a method. As you will see, you can also pass these unnamed data types to methods as parameters.
 
 A tuple has () brackets and then defines a number of items. Each item has a name and/or a data type. Items are separated by a comma. 
 
 - example: 
    `(left: Int, right: Int)`\
    `(Int, Int)` 
 
 Functions can return muliple values, specified as a tuple.
*/

func swap(left: Int, right: Int) -> (left: Int, right: Int) {
    return (right, left)
}

let swappedValues = swap(10, right: 20)

//: You can access the values using the names specified in the tuple

print(swappedValues.left)
print(swappedValues.right)

//: You can also access the values using the index for the position

print(swappedValues.0)
print(swappedValues.1)

//: The tuple doesn't have to specify names, so you could alternatively have:
func swapAlternative(left: Int, right: Int) -> (Int, Int) {
    return (right, left)
}

let swappedValuesAlternative = swapAlternative(15, right: 5)

//: In this situation, you could only use the index positions because there aren't any names
print(swappedValuesAlternative.0)
print(swappedValuesAlternative.1)

/*: 
 - example: *Tuple as a parameter*\
 You can also pass in a tuple as a parameter.\
\
   `func a(t: (Int, Int, Int)) -> Int {`\
   `    return t.0 + t.1 + t.2`\
   `}`\
\
 You can call this as:\
 \
 `a((10, 15, 12))`
 
 ## Activity 7
 
 Could you write a method called b that takes tuples with names as parameters?

*/

// write your answer here 

/*:
 
 # Activities - Answers
 
 Check your answers with the following example answers.
 
 ## Answer for 1
 */

let aValue = getMeAStringValue()

//: ## Answer for 2
add(number: 10, toOtherNumber: 2)

//: ## Answer for 3
func add(number: Int, toOtherNumber other: Int) -> Int {
    return number + other
}

//: ## Answer for 4
add(10, toOtherNumber: 10)

//: ## Answer for 5
addExternalNameExample(doubleOne: 5.0, doubleTwo: 10.5)

//: ## Answer for 6
setName(forename: "Neil", surname: "Taylor", initials: "S")
setName(forename: "Neil", surname: "Taylor")
setName(surname: "Neil", initials: "S")
setName(surname: "Taylor")


//: ## Answer for 7
func b(t: (one: Int, two: Int, three: Int)) -> Int  {
    return t.one + t.two + t.three;
}

b((one: 1, two: 2, three: 3))


//: [Next](@next) | [Contents](Content)
