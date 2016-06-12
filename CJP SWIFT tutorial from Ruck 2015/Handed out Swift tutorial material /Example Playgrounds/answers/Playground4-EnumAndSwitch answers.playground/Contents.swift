/*:

# Enums and switch statements

We will try a couple of different switch statement exercises

Simple enum for days of week
*/

enum daysOfWeek: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

print( daysOfWeek.Sunday.rawValue )   // Will be 7


var today = daysOfWeek.Monday
var whatToDo = ""
switch today{
case .Saturday, .Sunday:
    whatToDo = "Chill - it's the weekend"
default:
    whatToDo = "Apply nose to grindstone"
}

print( whatToDo ) // Will print “Apply nose to grindstone”

today = .Saturday // As we know type of today now, I don’t need to say “daysOfWeek”

/*:

Car example
*/

enum carReg {
    case New( String, Int, String )
    case Old( String, String, String )
    case Custom( String, Int )
}

func yearOfRegistration( carDets: carReg ) -> String{
    var result =  "unknown"
    switch carDets {
    case let .New(_, middle, _):
        if middle >= 50 {
            result = "\(1950+middle)"
        } else {
            result = "\(2000+middle)"
        }
    case let .Old(_, _, end):
       switch end {
            case "A": result = "1983"
            case "B": result = "1984"
        default: result = "Between 1985 and 1999"
        }
    case let .Custom( _, year):
        result = String(year)
    }
    return result
}

yearOfRegistration(carReg.New("CP", 57, "BHO"))
yearOfRegistration(carReg.New("HY", 07, "FPB"))
yearOfRegistration(carReg.Old("BOB", "007", "B"))  //Should be 1984

yearOfRegistration(carReg.Custom( "Q103LOL", 1993)) //Should be 1993

yearOfRegistration(.Custom( "XDOTDOT", 1984 )) // 1984


/*:
Here is an example of using a Switch statement with pattern matching to decide whether people are allowed to drink in a specified country, given their age.
*/


func allowedToDrink( age: Int, _ country: String ) -> String{
    switch (age, country){
    case (_, "Saudi Arabia"):
        return "Not allowed"
    case (let myAge, _) where age < 5:
        return "Infants of \(myAge) are never allowed"
    case (_, "United States" ):
        if age >= 21 {return "Allowed"}
        else {return "Not allowed"}
    default:
        return "Unknown"
    }
}

allowedToDrink( 44, "Saudi Arabia")
allowedToDrink( 4, "England")
allowedToDrink( 20, "United States")
allowedToDrink( 20, "Greece")
allowedToDrink( 17, "Mauritius" )

/*:
Now try to add some more cases to the allowedToDrink example:

It is never allowed in Libya and the Sudan.
Legal age is 18 in UK, Mauritius, Greece and Bermuda
*/


