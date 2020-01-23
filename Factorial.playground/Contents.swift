import UIKit



func factorial(_ number:  Int) -> Int {
   
    let  num  = number
    
    if num <= 0 {
        return 1
    }
    
    return (num * factorial(num-1))
}


print(factorial(5))
