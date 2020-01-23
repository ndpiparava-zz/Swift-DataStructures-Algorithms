import UIKit

func BinarySearch (findnumber: Int,  inputArray:[Int], startIndex: Int, endIndex: Int) -> Int {
    
    if startIndex == endIndex {
        if inputArray[startIndex] == findnumber {
            return startIndex
        }
        else {
            print("element does not exist")
            return -1
        }
    }
    else {
        
        let midIndex = (startIndex + endIndex) / 2
        if inputArray[midIndex] > findnumber {
           return BinarySearch(findnumber: findnumber, inputArray: inputArray, startIndex: startIndex, endIndex: midIndex)
        }
        else if inputArray[midIndex] < findnumber {
           return BinarySearch(findnumber: findnumber, inputArray: inputArray, startIndex: midIndex, endIndex: endIndex)
        }
        
        else if (findnumber == inputArray[midIndex] ) {
            return midIndex
        }
    }
    
    return -1
    
}


let array = [11,12,13,14,15,16,17,18,19,20,21,21,22,24,25,26,27,2,29,30]
print(BinarySearch(findnumber: 21, inputArray:array , startIndex: 0, endIndex: array.count))
