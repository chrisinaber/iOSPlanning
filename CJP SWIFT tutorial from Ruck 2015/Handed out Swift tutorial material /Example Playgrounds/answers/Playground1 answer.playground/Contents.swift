/*:

# Understanding Playgrounds and declaring values
Playgrounds allow you to explore what code does interactively.
It is possible to type code and see what it does.

The code below is what you get when you start a new iOS playground.

On the right, you can see what the value of str is.
If you alt-click on "str", it will tell you its type.
*/
import UIKit

var str = "Hello, playground"

/*:
Try declaring variables or constants with the values:

     1, 

     3.2

     true 

     [ "a", "be", "sea"]

in the space below and see what types and outputs you get.
*/

// Declare the variables here.
var val1 = 1

var val2 = 3.2

var val3 = true

var val4 = [ "a", "be", "sea"]
/*:
Try changing the declaration of "str" earlier to use "let" instead of "var" and see what happens.

You will want to change it back afterwards as an error in a Playground stops all later code from executing.
*/

str = "Goodbye, playground"

/*:
Where there is ambiguity over a declaration, you can give a specific type. Check that below
*/

let value: Float = 4.6

let realValue: Double = 4

var saying: String

/*:
Try declaring a constant Int without giving it a value.
Why is that OK?
*/

// let myConst: Int
// let myConst: Int = 1 

/*:
Try declaring another constant Int and giving it the value of the constant you just created.
Why is that NOT OK?
*/
//var x = myConst


/*:
Try setting the value of the first constant you declared. Then try doing it again.
*/




/*:
Expressions are the same as in most languages. Type safety means that you sometimes have to specify a type in the expression. For example, try adding value and realValue declared earlier together. You will find that you need to put "Double() around value to get it to work.
*/

//let thing = Double(value) + realValue


/*: 
Reporting of conclusions. You can mix bits of texts and other values by doing 'string interpolation'.
Put variables inside \( and ), and they will be evaluated.
*/

let answer = "\(value) + \(value) = \(value+value)"

/*:
In a Swift program, you would use 'print' to print things.
Here, you can just write an expression and it will be evaluated.
Try evaluating the string 'str' as part of a larger string.
Also can concatenate strings by using the + operator - try that too.
*/

//"value of str is \"\(str)\""



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
