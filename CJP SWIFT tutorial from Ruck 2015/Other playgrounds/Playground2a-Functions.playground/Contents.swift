//: Functions

import UIKit

func fahrenheitToCentrigrade( fTemp: Double ) -> Double {
    return (fTemp - 32.0) / 1.8
}

fahrenheitToCentrigrade( 32.0 )

fahrenheitToCentrigrade( -40.0 )

fahrenheitToCentrigrade( 212.0 )

fahrenheitToCentrigrade( 0 )


func ageAndPensioned( birthYear: Int) -> (age: Int, pensioned: Bool){
    let age = 2015 - birthYear
    return (age, age > 60)
}

var age: Int
var pensioned: Bool

(age, pensioned) = ageAndPensioned(1922)
age
pensioned


enum TempType {
    case degF
    case degC
}

func bothTemps( temp: Double, tempType: TempType) -> (tempC: Double, tempF: Double){
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

let result = bothTemps(32.0, .degF)

"\(result.tempC) deg C is \(result.tempF) deg F"

