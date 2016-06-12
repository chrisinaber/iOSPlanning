//: # Functions

//: A function that takes a `Double` variable and returns a `Double`
func fahrenheitToCentrigrade( fTemp: Double ) -> Double {
    return (fTemp - 32.0) / 1.8
}

fahrenheitToCentrigrade( 32.0 )

fahrenheitToCentrigrade( -40.0 )

fahrenheitToCentrigrade( 212.0 )

fahrenheitToCentrigrade( 0 )

//: A function that takes a `Int` variable and returns a `Tuple` containing a `Int` and a `Bool`
func ageAndPensioned( birthYear: Int) -> (age: Int, pensioned: Bool){
    let age = 2015 - birthYear
    return (age, age > 60)
}

var age: Int
var pensioned: Bool

(age, pensioned) = ageAndPensioned(1922)
age
pensioned

let answer = ageAndPensioned(1982)
answer.age
answer.pensioned


//: A function that takes a `Tuple` containing a `Double` and a `Enumeration` alaised as `TempType` and returns a `Tuple` containing two `Double`s
enum TempType {
    case degF
    case degC
}

func bothTemps( temp: Double, _ tempType: TempType) -> (tempC: Double, tempF: Double){
    var cTemp: Double
    var fTemp: Double
    switch tempType {
    case .degC:
        cTemp = temp
        fTemp = (temp * 1.8) + 32
    case .degF:
        cTemp = fahrenheitToCentrigrade( temp )
        fTemp = temp
    }
    return (cTemp, fTemp)
}

let result = bothTemps(32.0,  .degF)



"\(result.tempC) deg C is \(result.tempF) deg F"


 

