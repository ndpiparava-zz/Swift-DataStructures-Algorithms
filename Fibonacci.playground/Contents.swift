import UIKit

func fibonacciNumber(number: Int) ->  Int {
    
    if (number <= 1) {
        
        print("fibonacci is only for positive number")
        return number;
    }
    
    if( number == 1 || number == 2) {

        return (number - 1)
    }
    
    return fibonacciNumber(number: number - 1) + fibonacciNumber(number: number - 2)
}

print(fibonacciNumber(number: 4));
