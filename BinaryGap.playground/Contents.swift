import UIKit

var str = "Hello, playground"

let num = 10





func BinaryGap (_ number: Int) -> Int  {
    
    var max_gap : Int = 0
    var current_gap : Int = 0
    var num = number
    
    // division by 2 would produce each of bits right-to-left
    // i.e. 1096 in bin is:
    // 1 0 0 0 1 0 0 1 0 0 0
    
    // first we divide until we skip all trailing zeroes
    while num > 0 && num % 2 == 0 {
        num /= 2
    }
    
    while (num > 0) {
        
        num /= 2
        if (num % 2 == 1) {
            
            if current_gap > max_gap {
                max_gap = current_gap
            }
            current_gap = 0
            
        }
        else {
            current_gap += 1
        }
    }
 
    return max_gap;
}

let strbinary = String(9, radix: 2)
print(strbinary)
print
print(BinaryGap(67));

