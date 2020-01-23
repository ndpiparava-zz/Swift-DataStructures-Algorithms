import UIKit

var str = "Hello, playground"

public class SingleCircularLinkedListNode <T> {
    
   var next: SingleCircularLinkedListNode?
   var value: T
    
    public init(nodeValue: T) {
        self.value = nodeValue
    }
    
}

public final class SingleCircularLinkedList<T> {
    
    public typealias Node =  SingleCircularLinkedListNode<T>
    
    public var head:Node?
    public var tail: Node?
    
    public var size: Int = 0
    
     public func existLinkList() -> Bool {
       
           return head != nil
       }
    
    
    // MARK: -  1. Create Circular SingleLinkedList
    public func creatSingleCircularLinkedList(nodeValue: T) -> Node? {
        
        let node = SingleCircularLinkedListNode(nodeValue: nodeValue)
        
        self.head = node
        node.next = head
        self.tail = node
        self.size = 1
        
        return head
        
    }
    
   // MARK: -  2. Insert Node in Circular SingleLinkedList
    public func insertLinkedList(nodeValue: T, location: Int) {
        
        if (existLinkList()) {
            
            let newNode = Node(nodeValue: nodeValue)
            if(location == 0) {
                
                newNode.next = head
                head = newNode
                tail?.next = newNode
                
            }
            else if (location >= size) {
                
                newNode.next = head
                tail?.next = newNode
                tail = newNode
            }
            
            else {
                
                var tempNode = head
                
                var index = 0
                while (index < location-1) {
                    tempNode = tempNode?.next
                    index  = index + 1
                }
                
                newNode.next = tempNode?.next
                tempNode?.next = newNode
            }
            
            self.size += 1
        }
    }
    
    // MARK: - 3. Traversal of list Circular SingleLinkedList
    
    func traverseLinkedList() {
        
        if existLinkList() {
            
            var tempNode = head
            var index = 0
            while index < self.size {
                print("NodeValue : \(tempNode!.value)")
                tempNode = tempNode?.next
                index = index + 1
            }
            
            return
        }
        
        print("Linkedlist does not exist")
    }
    
   // MARK: -  Search Node in  Circular SingleLinkedList
    
    func searchNode (nodeValue: Int) -> Bool{
        
        if existLinkList() {
            
            var tempNode = self.head
            
            for var index in 0..<self.size {
                
                if tempNode!.value as! Int == nodeValue {
                    print("Node value found at : \(index)")
                    return true
                }
                tempNode = tempNode?.next
                index = index + 1
            }
        }
         return false
        print("LinkedList Does not exist")
        
    }
    
    // MARK: - . Deleteion of Node in CSLL
    
    func deletionOfNode (location : Int) {
        
        if existLinkList() {
            
            if location == 0 {
                
                self.head = self.head?.next
                self.tail?.next = self.head
                self.size = self.size - 1
                
            }
            
            else if (location >= self.size) {
                var tempNode = head
                for var index in 0..<self.size-1 {
                    
                    tempNode = tempNode?.next
                }
                
                if tempNode === head {
                    head = nil
                    head = nil
                    self.size = self.size - 1
                }
                
                tempNode?.next = head
                tail = tempNode
                self.size = self.size - 1
            }
            else {
                
                var tempNode = head
                for var index in 0..<location-1 {
                    tempNode = tempNode?.next
                }
                
                tempNode?.next = tempNode?.next?.next
                self.size = self.size - 1

            }
        }
    }
    
    // MARK: - 6. Delete Entire CSLL
    func deleteLinkedList() {
        
        if existLinkList() {
            
            self.head = nil
            if self.tail == nil {
                print("link list already deleted")
                return
            }
            else {
                self.tail?.next = nil
                self.tail = nil
                print("linkedlist successfully deleted")
            }
            
        }
        
        print("linklist does not exist")
    }

}


var singleCircularLinkedList = SingleCircularLinkedList<Int>()
singleCircularLinkedList.creatSingleCircularLinkedList(nodeValue: 10)
singleCircularLinkedList.insertLinkedList(nodeValue: 20, location: 3)
singleCircularLinkedList.insertLinkedList(nodeValue: 30, location: 3)
singleCircularLinkedList.insertLinkedList(nodeValue: 40, location: 3)
singleCircularLinkedList.traverseLinkedList()
singleCircularLinkedList.searchNode(nodeValue: 30)

singleCircularLinkedList.deletionOfNode(location:1)
singleCircularLinkedList.traverseLinkedList()
singleCircularLinkedList.deleteLinkedList()
singleCircularLinkedList.traverseLinkedList()
