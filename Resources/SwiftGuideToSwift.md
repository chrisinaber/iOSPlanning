#A Swift Guide to Swift

The Swift programming language was released by Apple, Inc. in 2014. This document highlights the main features in the language.

Further details can be found in the [Swift Programming Language (Swift 2.2)](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0) document from Apple. The document from Apple includes a very readable introduction, called A Swift Tour, which walks through the main issues and provides more discussion than is included in this document. 

## <a href="#contents"></a>Contents 

- [Variables and Constants](#variables)
- [Classes, Structs, Enums and Protcols](#csep)
    * [Structs](#structs)
- [Common Operators](#commonoperators)
    * [Binary Operators](#binaryoperators)
    * [Binary Shorthand](#binaryshorthand)
    * [Unary Operators](#unaryoperators)
    * [Boolean Tests](#booleantests)
 

## <a href="#variables"></a>Variables and Constants
If you want to define a variable the  use the **var** keyword. A variable is something that can be changed after the declaration statement.  

    // 1. Define an Int variable with the value 42
    var answer = 42
    
    // 2. Defines an uninitialised Int variable
    var temperature: Int  

    // 3. Similar to statement 1, but includes the type name (Int). 
    // The type name is not needed, because Swift can infer the 
    // type of the variable based on the value that is assigned. 
    var answer: Int = 42 
    
If you are not going to change the value of a variable, you are strongly encouraged to make it a constant so that the compiler can optimise it. You do this by using **let** instead of **var**.

    // Makes a constant, of type Double
    let pi = 3.1412

Once the value has been assigned for the let statement, it cannot be changed. A compiler error will be raised if there is an attempt to change the value.

[Back to Contents](#contents)

## <a href="#csep"></a>Classes, Structs, Enums and Protocols
Swift provides different ways to specify named data types. The four areas to mention are covered in the following sections, looking at Classes, Structs, Enums and Protocols. If you have experience in Java, then Classes and Enums will look familiar and Protocols are similar to interfaces.If you have experience in C#, Structs will also look familiar.  


### <a href="#classes"></a>Declaring instances of Classes 

Here is something about classes.

[Back to Contents](#contents)


### <a href="#struct"></a>Struct

Here is something about struct data types.

[Back to Contents](#contents)



## <a name="commonoperators"></a>Common Operators 

### <a name="binaryoperators"></a>Binary Operators
These operators have an expression on the left and the right of the operator. 

    +     Add   // e.g. y = a + b. Works with strings, too.
    -     Subtract 
    *     Multiply 
    /     Divide 
    %     Modulus 

### <a name="binaryshorthand"></a>Binary Shorthand
These operators are shorthand for different the binary operation combined with assignment. 

    +=    Add and assign, e.g. y += 21 
    -=    Subtract and assign 
    *=    Multiply and assign 
    /=    Divide and assign  
    %=    Modulus and assign 
     
### <a name="unaryoperators"></a>Unary Operators

    -     Minus, e.g. y = -x 

The following two unary operators are permitted in Swift 2. However, they will be removed from the language in Swift 3. You should use += 1 instead of ++ and -= 1 instead of --. 

    --    Decrement, e.g. y-- or --y
    ++    Increment, e.g. y++ or ++y

### <a name="booleantests"></a>Boolean tests - return true or false

## Conditional Statements 


### if statement 

    if comparison1 { 
        // called if comparison 1 is true 
    }
    else if comparison 2 { 
        // called if comparison 2 is true 
    }
    else {
        // called if none of the conditions are true
    }    

The braces are required. You can include brackets around a condition, but these are optional. An example if statement is shown below. 

    // some variable definitions 
    
    if temperature > comfyTemperature {
        uncomfortable = true
        println( "Someone turn the fan on" ) 
    } else {
        uncomfortable = false
        println( "Feeling fine" )
    } 

### switch statement 



## Iteration 

## Acknowledgements
This document is based on material written by [Prof. Chris Price](http://www.aber.ac.uk/en/cs/staff-list/staff_profiles/?login=cjp) from the Department of Computer Science, Aberystwyth University. It has been adapted with his permission and this adaption is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
