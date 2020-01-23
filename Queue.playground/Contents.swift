import UIKit

//MARK:- Stack is not physical datastruture like array, linkedlist, it is more like logical datastructure where underneath Array or stack being used to achive Stack like logical structure



//MARK:- Queue By Array
/*MARK:-Linear Queue ( Queue By Array)
 Singular queue means having fixed size of queue and not deleting elements while DeQueue operation so if dequeue element than that space can not be used for new elements since element is not deleted.
 
 Better to stick with circular QUEUE.
 */


public class QueueByArray<T> {
    
    var elementsArray:[T] = []
    var beginningOfQueue = 0
    var topOfQueue = 0
    
    public func isEmpty() -> Bool{
        
        return self.elementsArray.count == 0
    }
    
    public func enQueue(value: T) {
        
        //Enqueue element to beginningOfQueue position
        
        /*increase index if queue is not empty, when it empty should start with 0,
        which is default value of topOfQueue  so need of increase*/
        if !isEmpty() {
            
            topOfQueue += 1
        }
        self.elementsArray.insert(value, at: topOfQueue)
        
        
    }
    public func deQueue() {
        
        if isEmpty() {
            print("Queue is empty")
            return
        }
        
        //SINCE Queue is FIFO, always remove first one first
        let deQueueElement = self.elementsArray[beginningOfQueue]
        print("deQueue value is : \(deQueueElement)")
        
        //Increase beginningOfQueue index every time to travsere the queue whenever deQue Method gets called
        beginningOfQueue += 1
        
        if beginningOfQueue > topOfQueue {
            
            print("Queue is deQueued")
            beginningOfQueue = 0
            topOfQueue = 0
        }
    }
    
    public func peek() {
           
           if isEmpty() {
               print("Queue is underflow")
               return
           }
           
           //Peek last element
        let peekedElement = self.elementsArray[beginningOfQueue]
           print("peeked value is : \(peekedElement)")
    }
    
    public func deleteQueue() {
        
        self.elementsArray.removeAll()
    }
    
    public func printQueue() {
        
        
       // for _ in 0..<self.size-1
        for var index in self.beginningOfQueue...self.topOfQueue {
            
            print ("Queue print : \(self.elementsArray[index])")
            index += 1
        }
    }
}


var linearQueueByArray = QueueByArray<String>()
linearQueueByArray.enQueue(value: "1")
linearQueueByArray.enQueue(value: "5")
linearQueueByArray.enQueue(value: "6")
linearQueueByArray.enQueue(value: "7")
linearQueueByArray.enQueue(value: "8")

linearQueueByArray.deQueue()

linearQueueByArray.printQueue()
linearQueueByArray.peek()


/*MARK:-Circular Queue ( Queue By Array)
 Here to note that, i have used Array which auto atically adjust it elements if we remove
 element from index 0, if some language does not support such array behaviour than we have manage
 empty cells when we deQueue element, these should be reusable.
 
 To do that use below params
 
 int topOfQueue -> to maintain the index of top elements in array
 int start -> to point start of the queue, once you delete/enqueue element, move/increase to next element to keep track of which element is top to deque
 int size -> size of an array
 */
public class CircularQueueByArray<T> {
    
    var elementsArray:[T] = []
    
    public func isEmpty() -> Bool{
        
        return self.elementsArray.count == 0
    }
    
    public func enQueue(value: T) {
     
        self.elementsArray.insert(value, at: self.elementsArray.count)
        
        
    }
    public func deQueue() {
        
        if isEmpty() {
            print("Queue is empty")
            return
        }
        
        //SINCE Queue is FIFO, always remove first one first
        let deQueueElement = self.elementsArray.remove(at: 0)
        print("deQueue value is : \(deQueueElement)")
        
       
    }
    
    public func peek() {
           
           if isEmpty() {
               print("Queue is underflow")
               return
           }
           
           //Peek last element
        let peekedElement = self.elementsArray[0]
           print("peeked value is : \(peekedElement)")
    }
    
    public func deleteQueue() {
        
        self.elementsArray.removeAll()
    }
    
    public func printQueue() {
        
        
       // for _ in 0..<self.size-1
        for var index in 0...self.elementsArray.count-1 {
            
            print ("Queue print : \(self.elementsArray[index])")
            index += 1
        }
    }
}

print("*****************Circular Queue**********")

var circularlinearQueueByArray = CircularQueueByArray<String>()
circularlinearQueueByArray.enQueue(value: "1")
circularlinearQueueByArray.enQueue(value: "5")
circularlinearQueueByArray.enQueue(value: "6")
circularlinearQueueByArray.enQueue(value: "7")
circularlinearQueueByArray.enQueue(value: "8")

circularlinearQueueByArray.deQueue()

circularlinearQueueByArray.printQueue()
circularlinearQueueByArray.peek()




//MARK:- Queue By LinkedList (LinearQueue)

public class LinkedListNode<T> {
    
    public var value: T
    public var next:LinkedListNode<T>?
    
    public init (value: T) {
        self.value = value
    }
}

public class QueByLinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    var head : Node?
    var tail : Node?
    
    var size = 0
    
    public func isEmpty() -> Bool {
        
        return self.head == nil
    }
    
    public func createQueue() -> Node?{
        
        self.head = nil
        self.tail = nil
        
        return self.head
    }
    
    public func enQueue(value: T) {
        
        let newNode = Node(value: value)
        newNode.next = nil
        
        if isEmpty() {
            self.head = newNode
            self.tail = newNode
        }
        
        else {
            
            self.tail?.next = newNode
            self.tail = newNode
        }
        
        size += 1
    }
    
    public func deQueue()  {
        
        
        if isEmpty() {
            print("Queue is empty")
            return
        }
        
        let tempNode = self.head
        self.head = self.head?.next
        
        print("enQueued Element is:\(tempNode!.value)")
        
        self.size -= 1
        
    }
    
    public func peek() {
        
        if isEmpty() {
            print("Queue is empty")
            return
        }
        
        let tempNode = self.head
        
        print("Peeked Element is:\(tempNode!.value)")
    
    }
    
    public func printQueue() {
        
        if isEmpty() {
            print("Queue is empty")
            return
        }
        
        for var index  in 0..<self.size {
            
            print("\(index) element is: \(self.head!.value)")
            self.head = self.head?.next
        }
    }
    
    public func deleteQueue() {
        
        self.head = nil
        self.tail = nil
    }
    
}

print("********************* Queue by LinkedList *************")

var queueByLinkedList = QueByLinkedList<String>()
queueByLinkedList.enQueue(value:"1")
queueByLinkedList.enQueue(value:"2")
queueByLinkedList.enQueue(value:"3")
queueByLinkedList.enQueue(value:"4")

queueByLinkedList.deQueue()
queueByLinkedList.deQueue()

queueByLinkedList.enQueue(value: "1")

queueByLinkedList.peek()

queueByLinkedList.printQueue()
