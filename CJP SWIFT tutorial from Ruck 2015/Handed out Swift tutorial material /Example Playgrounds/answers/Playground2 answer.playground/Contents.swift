/*:

# Control structures


Try writing a loop that goes from 1 to 100, and prints "buzz" if the number is divisble by 3 and the number if it is not.
If number % 3 == 0 then it is divisible by 3
*/


for x in (1...100) {
    if x  % 3 == 0 {
        print( "Buzz" )
    } else {
        print( x )
    }
}
