/*:

# Control structures


Try writing a loop that goes from 1 to 100, and prints "buzz" if the number is divisible by 3 and the number if it is not.
If number % 3 == 0 then it is divisible by 3
*/
var i = 1
while i <= 100 {
    if i % 3 == 0 {
        print( "buzz" )
    } else {
        print( i )
    }
    i++
}


