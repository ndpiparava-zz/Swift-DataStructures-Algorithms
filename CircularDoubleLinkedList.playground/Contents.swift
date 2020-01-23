import UIKit

import UIKit


public class CircularDoubleLinkedListNode<T> {
    
    var next: CircularDoubleLinkedListNode?
    var prev: CircularDoubleLinkedListNode?
    var value : T
    
    public init (value: T) {
        self.value = value
    }
    
//    static func ==(lhs: T, rhs: T) -> Bool {
//        return lhs.value == rhs.value
//    }
}


public class CircularDoubleLinkedList<T> {
    
    public typealias Node = CircularDoubleLinkedListNode<T>
    
    public var head : Node?
    public var tail : Node?
    
    public var size: Int = 0
    
    public func existLinkedList() -> Bool {
        return self.head != nil
    }
    
    // MARK: -  Create CDLL
    public func createLinkList(nodeValue: T) -> Node?{
        
        let newNode = Node(value:nodeValue)
        newNode.next = newNode
        newNode.prev = newNode
        self.head = newNode
        self.tail = newNode
        self.size = 1
        
        return head
        
    }
    
    // MARK: - insert Node in CDLL
    func insertLinkList(nodeValue: T, location: Int) {

        let newNode = Node(value: nodeValue)

        if existLinkedList() {

            if location == 0 {
                newNode.next = self.head
                newNode.prev = tail
                self.head?.prev = newNode
                self.head = newNode
                self.tail?.next = newNode
            }
            else if (location >= self.size) {

                newNode.next = self.head
                newNode.prev = self.tail
                self.head?.prev = newNode
                self.tail?.next = newNode
                self.tail = newNode
            }

            else {
                var tempNode = self.head
                for _ in 0..<self.size-1 {
                 tempNode = tempNode?.next
                }

                newNode.next = tempNode?.next
                newNode.prev = tempNode
                newNode.next?.prev = newNode
                tempNode?.next = newNode

            }

            self.size = self.size + 1
            return
        }
        
        print("Linklist does not exist")
    }
    
    // MARK: -  CDLL Travese CDLL
    func traveseLinkList () {
        
        if existLinkedList() {
            
            var tempNode = self.head
            for _ in 0..<self.size {
                
                print("NodeValue: \(tempNode!.value)")
                tempNode = tempNode?.next
            }
        }
        
        else{
            print("Linklist does not exist")
        }
    }
    
    // MARK: - Search Node in CDLL
    func searchNode(nodeValue: Int) -> Bool {
        
        if existLinkedList() {
            
            var tempNode = self.head
            for var index in  0..<self.size {
                if tempNode!.value as! Int == nodeValue {
                    
                    print("Node found at index : \(index)")
                    return true
                }
                tempNode = tempNode?.next
                index = index + 1
            }
        }
        
       
        print("Linklist does not exist")
         return false
    }
    
    // MARK: - CDLL Delete Node
    func deleteOfNode(location:Int) {
        
        if existLinkedList() {
            
            if location == 0 {
                
                if self.size == 0 {
                    
                    self.head?.next = nil
                    self.head?.prev = nil
                    self.head = nil
                    self.tail = nil
                    self.size = self.size - 1
                    return
                }
                else  {
                    
                    self.head = self.head?.next
                    self.head?.prev = nil
                    self.tail?.next = self.head
                    self.size = self.size - 1
                    return
                }
                
            }
            
            else if (location >= self.size) {
                
                let tempNode = tail?.prev
                
                if tempNode === self.head {
                    self.head?.next = nil
                    self.head?.prev = nil
                    self.head = nil
                    self.tail = nil
                    self.size = self.size - 1
                    return
                }
                
                else {
                    self.tail = self.tail?.prev
                    self.tail?.next = self.head
                    self.head?.prev = self.tail
                    self.size = self.size - 1
                  return
                    
                }
            }
            
            else {
                
                var tempNode = self.head
                for _ in 0..<location - 1 {
                    tempNode = tempNode?.next
                }
                
                tempNode?.next = tempNode?.next?.next
                tempNode?.next?.prev = tempNode
                self.size = self.size - 1
                return
            }
        }
        
        print ("LinkList does not exist")
    }
    
    // MARK: -  Delete Entire CDLL
    func deleteLinklist() {
        
        if existLinkedList() {
            
            var tempNode = self.head
            
            for _ in 0..<self.size {
                tempNode?.prev = nil
                tempNode = tempNode?.next
            }
            
            self.head?.prev = nil
            self.head = nil
            self.tail?.next = nil
            self.tail = nil
            print("linkedlist deleted successfully")
        }
        
        print("linklist does not exist")
    }
}


var doubleLinkList  = CircularDoubleLinkedList<Int>()
doubleLinkList.createLinkList(nodeValue: 10)

doubleLinkList.insertLinkList(nodeValue: 20, location: 1)
doubleLinkList.insertLinkList(nodeValue: 30, location: 3)
doubleLinkList.insertLinkList(nodeValue: 40, location: 4)
doubleLinkList.insertLinkList(nodeValue: 50, location: 5)

doubleLinkList.traveseLinkList()
doubleLinkList.searchNode(nodeValue: 20)


doubleLinkList.deleteOfNode(location: 2)
doubleLinkList.traveseLinkList()

doubleLinkList.deleteLinklist()
doubleLinkList.traveseLinkList()

