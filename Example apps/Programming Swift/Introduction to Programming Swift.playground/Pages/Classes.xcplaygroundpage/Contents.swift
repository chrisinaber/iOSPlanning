/*:
 [Previous](@previous) | [Contents](Content)

 # Classes
 
 This playground summarises the main issues for classes
 
 ## Class Initialisation

 A class is setup using an initialiser, which has the name init. It doesn't use the keyword func.
*/

import Foundation

class Circle {
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

//: You can have several init methods, providing alternative ways to initialise the object.

//: Initialisers (init methods) use external names by default for all parameters, which is the same as the one specified for the internal name. This is because the names are significant to help differentiate one from another if there are multiple init methods for a single class.

/*************************************************
 // Activity
 // 4.1 How would you create an instance of Circle? Type it in an try it.
 //
 // Hint: don't call the let/var name as c, because that is used at the end of this playground, and will make it seem as though your line is an error.
 **************************************************/

// If you don't want one of the parameters for init to use an external name, add the _ character before the name.

class Name {
    
    var forename: String
    var surname: String
    
    init(_ forename: String, surname: String) {
        self.forename = forename
        self.surname = surname
    }
    
    init(_ forename: String) {
        self.forename = forename
        self.surname = "Unknown"
    }
}

var name1 = Name("Neil", surname: "Taylor")
var name2 = Name("Sarah")

/*:
 
 ## Class Extensions 
 
 
 */

extension String {
    func rangeFromNSRange(nsRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
}

//: [Next](@next) | [Contents](Content)
