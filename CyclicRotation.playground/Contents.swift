import Cocoa

var str = "Hello, playground"

func cyclicRotation(_ inputArray:[Int], _ rotation:Int) -> [Int] {
    
    if (inputArray.count <= 1 || rotation <= 0) {
        return inputArray;
    }
    var array = inputArray;
    var lastpart = array[(array.count-rotation)..<array.count];
    var firstpart = array[0..<(array.count-rotation)];
    var result = Array(lastpart) + Array(firstpart)
    
    return result
}


print(cyclicRotation([1,2,3,4,5,6,7], 7))
