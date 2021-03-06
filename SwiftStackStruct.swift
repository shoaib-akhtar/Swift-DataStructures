struct Stack<T>{
    private var array : [T] = []
    
    mutating func push(_ element: T)  {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
    var count: Int {array.count}
    
    var isEmpty: Bool {array.isEmpty}
    
    func printStack() {
        print("Stack",array)
    }
}

var swiftStack : Stack = Stack<String>()

print(swiftStack.isEmpty)
swiftStack.push("a")
print(swiftStack.count)
swiftStack.push("b")
print(swiftStack.count)
swiftStack.push("c")
print(swiftStack.isEmpty)
swiftStack.printStack()
swiftStack.pop()
swiftStack.pop()
swiftStack.pop()
swiftStack.pop()
print(swiftStack.isEmpty)
