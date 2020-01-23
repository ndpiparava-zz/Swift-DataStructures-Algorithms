import UIKit

//MARK:- Stack is not physical datastruture like array, linkedlist, it is more like logical datastructure where underneath Array or stack being used to achive Stack like logical structure



//MARK: - Stack through Array

public class Stack<T> {
    
    var elememtsArray: [T] = []
    
   /* incase of fixed size array
    var elememtsArray: [T] = Array(repeating: T.self, count: 50) as! [T] *
     
      var size: Int
     
     public init(size: Int) {
         self.size = size
     }
     
    */
    
   
    
    public func isEmpty()-> Bool {
        
        if self.elememtsArray.count == 0 {
            return true
        }
        
        return false
    }
    
    //MARK:- Push, add element in array
    public func push(value: T) {
        
        self.elememtsArray.append(value)
        print("Successfully inserted  \(value)  in the stack")
    }
    
    //MARK:- Pop element in LIFO manner
    public func pop () {
        
        if isEmpty() {
            print("Stack is underflow")
            return
        }
        
        let removedElement = self.elememtsArray.remove(at: self.elememtsArray.count-1)
        print("Stack has successfully deleted \(removedElement)")
    }
    
    //MARK:- Peek operation does not remove element, it just return element on the top.
    public func peekOperation() {
        
        if isEmpty() {
            print("Stack is underflow")
            return
        }
        
        print("Top of Stack: \(self.elememtsArray[self.elememtsArray.count-1])")
        
    }
    
    public func deleteStack() {
        self.elememtsArray.removeAll()
        self.elememtsArray = []
        print("Stack is successfully deleted")
    }
}


var stack = Stack<String>()
stack.push(value: "1")
stack.push(value: "2")
stack.push(value: "3")
stack.push(value: "4")
stack.push(value: "5")
stack.push(value: "6")
stack.push(value: "7")

stack.peekOperation()
stack.pop()

stack.peekOperation()

stack.deleteStack()

stack.peekOperation()



//MARK: - Stack through LinkedlIst

public class SingleLinkedList<T> {
    
    var value : T
    var next: SingleLinkedList<T>?
    
    public init (value: T) {
        self.value = value
    }
}

public class StackByLinkedList<T> {

    public typealias Node = SingleLinkedList<T>
    
    public var head : Node?
    public var tail : Node?
    

    public func isEmpty()-> Bool {
        
        return self.head == nil
    }
    
   public func createStack() -> Node? {
        
        head = nil
        
        return head
    }
    
      //MARK:- Push, add element in stack
    public func push(value:T) {
        let newNode = Node(value: value)
        newNode.next = head
        self.head = newNode
    }
    
    //MARK:- Pop, remove element from stack
    public func pop() {
        if isEmpty() {
            print("Stack is underflow")
        }
        
        let tempNode = self.head
        self.head = self.head?.next
        
        print("Poped value is \(String(describing: tempNode?.value))")
    }
    
    //MARK:- Peek, will just peek top element in stack, element will not be removed unlike Pop
    public func peek() {
        if isEmpty() {
            print("Stack is underflow")
        }
        
          let tempNode = self.head
          print("Peeked value is \(String(describing: tempNode?.value))")
    }
    
    //MARK:- Delete Stack,i.e delete entire SSL
    
    public func deleteStack() {
        
        self.head=nil
    }
}


var stackBySSL = StackByLinkedList<String>()
stackBySSL.createStack()
stackBySSL.push(value: "1")
stackBySSL.push(value: "2")
stackBySSL.push(value: "8")
stackBySSL.push(value: "3")
stackBySSL.push(value: "4")

stackBySSL.pop()
stackBySSL.peek()
stackBySSL.pop()
stackBySSL.peek()

stackBySSL.deleteStack()
