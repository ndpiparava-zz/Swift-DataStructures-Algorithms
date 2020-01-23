import UIKit

public class LinkedListNode<T> {
    var value : T
    var next: LinkedListNode?
    ///weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}



/******************* Create Linked List **************/

public final class SingleLinkedList<T> {
    
   
    /// Typealiasing the node class to increase readability of code
    public typealias Node = LinkedListNode<T>
    
    
    /// The head of the Linked List
    private var head: Node?
    
    /// The Tail of the Linked List
    private var tail: Node?
    
    //size of the list
    private var size: Int = 1
    
    
    public func getHead() -> Node? {
        return head;
    }
    
    public func getTail() -> Node? {
        return tail
    }
    
    public func setHead(node: Node?) {
        self.head = node
    }
    
    public func setTail(node: Node?) {
        return self.tail = node
    }
    

    public func setSize(size: Int) {
        self.size = size
    }
    
    public func getSize() -> Int {
        return self.size
    }
    
    public func existLinkList() -> Bool {
    
        return head != nil
    }
    
    public func node(at index: Int) -> Node? {
        
        assert(head != nil, "List is empty")
        assert(index >= 0, "Index must be greater than zero")
        
        if index == 0 {
            return head
        }
        else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            assert(node != nil, "index is out of bound")
            return node
        }
    }
    
    
    //MARK: 1.Create SingleLinkedList
    public func createSingleLinkedList(nodeValue: T ) -> Node? {
        
        let node = Node(value: nodeValue)
        self.head  = node
        self.tail = node
        self.size = 1
        return head
    }
    
    
    // MARK: -  2.Insert Node in SSL
    public func inserInLinkedList(nodeValue: T, location: Int) {
        
        let node = Node(value: nodeValue)
        
        if(!existLinkList()) {
            
            print("linklist does not exist")
           
        }
        
        else if (location == 0) {
            
            node.next = head
            head = node
        }
        
        else if (location >= size) {
            
            node.next = nil
            tail?.next = node
            tail = node
        }
        
        else  {
            var index = 0
            var tempNode = head
            while (index == location - 1)  {
                 tempNode = tempNode?.next
                index = index + 1
            }
            
            node.next = tempNode?.next
            tempNode?.next = node
        }
        
        self.size = self.size + 1
    }
    
    // MARK: -  3. SSL Travsersal
    func  traverserLinkedList() {
        
        if (!self.existLinkList()) {
            
            print("Linkedlist does not exist")
            return
        }
        
        var tempNode = self.head
        
        for _  in 1...self.size {
            
            print(tempNode!.value )
            tempNode = tempNode?.next
        }
    }
    
    // MARK: -  4. Search Node
    
    func searchNode(nodeValue: Int) -> Bool {
        
        if existLinkList() {
            
            var tempNode = self.head
            for var index in 0..<getSize() {
                let value: Int = tempNode!.value as! Int
                if value == nodeValue {
                    print("node found at location: \(index)")
                    return true
                }
                tempNode = tempNode?.next
                
            }
        }
        
        print("node does not exist")
        return false
    }
    
    // MARK: -  5.Delete Node
    
    func deleteOfNode(location: Int) {
        
        if !existLinkList() {
            print("Linkedlist does not exist")
        }
        
        else if (location == 0) {
            
            head = head?.next
            self.size -= 1
            
            if self.size == 0 {
                tail = nil
            }
        }
        
        else if (location >= self.size) {
            
            var index = 0
            var tempNode = head
            for _ in index...self.getSize()-1 {
                
                tempNode = tempNode?.next
                index = index + 1
            }
            
            if(tempNode === head) {
                head = nil
                tail = nil
                self.size -= 1
                return
            }
            
            tempNode?.next = nil
            tail = tempNode
            self.size -= 1
            
        }
        
        else {
            
            var tempNode = head;
            
            print("size= \(self.getSize())")
            for _ in 0..<location-1{
                
                tempNode = tempNode?.next
                
            }
            
            print(" Node to be deleted :\n \(String(describing: tempNode?.next?.value))")
            tempNode?.next = tempNode?.next?.next
            
            self.size -= 1
            
        }
    }
    
    // MARK: -  Deleter Entire SLL
    func deleteLinklist () {
        self.head = nil
        self.tail = nil
        self.size = 0
        print("linklist deleted")
    }
        
}

let singleLinkedlist = SingleLinkedList<Int>()
singleLinkedlist.createSingleLinkedList(nodeValue: 10)
singleLinkedlist.inserInLinkedList(nodeValue: 20, location: 2 )
singleLinkedlist.inserInLinkedList(nodeValue: 30, location: 5 )
singleLinkedlist.inserInLinkedList(nodeValue: 40, location: 6 )
singleLinkedlist.inserInLinkedList(nodeValue: 50, location: 7 )
print("sizeoflist : \(singleLinkedlist.getSize())")

singleLinkedlist.traverserLinkedList()

singleLinkedlist.deleteOfNode(location: 1)
singleLinkedlist.traverserLinkedList()

singleLinkedlist.searchNode(nodeValue: 40)

singleLinkedlist.deleteLinklist()
singleLinkedlist.traverserLinkedList()


