class BST<T: Comparable>{
    private var data: T
    private var parent: BST?
    private var left: BST?
    private var right: BST?
    
    init(data: T,parent: BST?) {
        self.data = data
        self.parent = parent
    }
    
    func isLeaf() -> Bool {
        return left == nil && right == nil
    }
    
    // Insert
    func insert(data: T) {
        if data > self.data{
            // Insert in Right
            if let right = self.right{
                right.insert(data: data)
            }else{
                self.right = BST.init(data: data, parent: self)
            }
        }else{
            // Insert in left
            if let left = self.left{
                left.insert(data: data)
            }else{
                self.left = BST.init(data: data, parent: self)
            }
        }
    }
    
    // Search
    func search(data: T) -> BST? {
        if data > self.data{
            // Search Right
            return right?.search(data: data)
        }else if data < self.data{
            // Search Left
            return left?.search(data: data)
        }else{
            return self
        }
    }
    
    // Traversal
    func traverseInOrder(block: (T) -> Void) {
        left?.traverseInOrder(block: block)
        block(data)
        right?.traverseInOrder(block: block)
    }
    func traversePostOrder(block: (T) -> Void) {
        left?.traverseInOrder(block: block)
        right?.traverseInOrder(block: block)
        block(data)
    }
    func traversePreOrder(block: (T) -> Void) {
        block(data)
        left?.traverseInOrder(block: block)
        right?.traverseInOrder(block: block)
    }
    
    // Height
    func height() -> Int {
        if isLeaf(){
            return 0
        }else{
            return 1 + max(right?.height() ?? 0, left?.height() ?? 0)
        }
    }
}

let myBST = BST.init(data: "a", parent: nil)
myBST.insert(data: "b")
myBST.insert(data: "c")
myBST.insert(data: "d")
myBST.insert(data: "e")

myBST.search(data: "z")
myBST.search(data: "c")

myBST.traverseInOrder { (value) in
    print(value)
}
