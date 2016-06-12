//: Enumerations

import UIKit

enum myBool {
    case YES
    case NO
}
let isHappening = myBool.YES
//
isHappening == .YES


enum daysOfWeek: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
daysOfWeek.Sunday.rawValue

var today = daysOfWeek.Monday
var whatToDo = ""
switch today{
case .Saturday, .Sunday:
    whatToDo = "Chill - it's the weekend"
default:
    whatToDo = "Apply nose to grindstone"
}

whatToDo

today = .Saturday

enum carReg {
    case New( String, Int, String )
    case Old( String, String, String )
    case Custom( String, Int )
}

var myCar = carReg.New("CP", 57, "BHO")

myCar = .Old( "ABB", "007", "P")

myCar = .Custom( "XDOTDOT", 1984 )

func yearOfRegistration( carDets: carReg ) -> String{
    var result =  "unknown"
    switch carDets {
    case let .New(start, middle, end):
        if middle >= 50 {
            result = "\(1950+middle)"
        } else {
            result = "\(2000+middle)"
        }
    // How would you replace the default by
    default:
        result = "old"
    }
    return result
}

yearOfRegistration(carReg.New("CP", 57, "BHO"))
yearOfRegistration(carReg.New("HY", 07, "FPB"))
