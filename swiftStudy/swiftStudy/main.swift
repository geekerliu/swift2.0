//
//  main.swift
//  swiftStudy
//
//  Created by LiuWei on 15/10/8.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

//MARK: Swift2.0学习：基础部本
// Swift是一个类型安全的语言type safe
// 类型推断type inference，当你没有显示的定义变量的类型时，Swift会自动推断变量的类型。
func chapter1() {
    let anotherPi = 3 + 0.14159 //同时出现了Int和Double，会被推断为Double类型
    
    // 类型转换 SomeType(ofInitialValue)
    let str = "18"
    let age = Int(str) // age的类型为Int？，因为转换可能失败
    
    // 类型别名，可以用typealias给先用的类型定义一个别名
    typealias AudioSample = UInt16
    
    //tuples,元组内的值可以是任意类型,并不要求是相同类型。作为函数返回值时,元组非常有用。
    let http404Error = (404, "Not Found")
    
    //optionals,有值或者没用值
    let possibleNumber = "123"
    let convertNumber = Int(possibleNumber)
    // 如果你申明了一个可选变量或常量没有赋值，它们会被自动设置成nil
    var surveyAnswer:String?
    
    // optional binding，判断成功就解包赋值给一个变量
    
    // implicitly unwrapped optionals,如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型.
    
    // error handling
    /*
    do {
    try
    } catch {
    
    }
    */
    
    // assertion
}

//MARK: 基本运算符
func chapter2() {
    //1.赋值运算符
//    let (x, y) = (1, 2)
//    if x = y { //错，与 C 语言和 Objective-C 不同,Swift 的赋值操作并不返回任何值
//        
//    }
    let a = 8 % 2.5//可对浮点数求余
    print(a)
    
    //Nil Coalescing Operator ??
    //空合运算符( a ?? b )将对可选类型 a 进行空判断,如果 a 包含一个值就进行解封,否则就返回一个默认值 b,必须满足下面两个条件
    //1.表达式 a 必须是Optional类型
    //2.默认值 b 的类型必须要和 a 存储值的类型保持一致
    let defaultColorName = "red"
    var userDefinedColorName:String? //默认值为nil
    userDefinedColorName = "green"
    var colorNameToUse = userDefinedColorName ?? defaultColorName
    print(colorNameToUse)
    
    //区间运算符 
//    a...b 闭区间
//    a..<b 半开半闭区间
    
}

//MARK: Strings and Characters
func chapter3() {
    //Strings Are Value Types
    //Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 
    //很明显无论该值来自于哪里,都是您独 自拥有的。 您可以放心您传递的字符串本身不会被更改。
    for character in "Dog!?😀😁😂".characters {//根据字符来遍历
        print(character)
    }
    
    
    let string1 = "hello"
    let string2 = " there"
    var welcome = string1 + string2
    let exclamationMark: Character = "!"
    welcome.append(exclamationMark)//String 和 character不能直接相加
    print(welcome)
    
    //Accessing and Modifying a String
    let greeting = "Guten Tag!😀😁😂"
    greeting[greeting.startIndex] //G
    greeting[greeting.endIndex.predecessor()]//!
    greeting[greeting.startIndex.successor()]//u
    let index = greeting.startIndex.advancedBy(7)
    print(greeting[index]) //a
    
    for index in greeting.characters.indices {//根据下标来遍历
        print("\(greeting[index]) ", terminator: "")
    }
    
    //Inserting and Removing
    var welcome1 = "hello"
    welcome1.insert("!", atIndex: welcome1.endIndex)//插入一个字符
    welcome1.insertContentsOf("123456".characters, at: welcome1.endIndex)//插入一串字符
    print(welcome1)
    welcome1.removeAtIndex(welcome1.endIndex.predecessor())//移除一个
    print(welcome1)
    let range = welcome1.endIndex.advancedBy(-6) ..< welcome1.endIndex//移除一个范围的
    welcome1.removeRange(range)
    print(welcome1)
    
    //Comparing String
    //String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=), as described in Comparison Operators
    //prefix equality, and suffix equality
    let romeoAndJuliet = [
        "Act 1 Scene 1: Verona, A public place",
        "Act 1 Scene 2: Capulet's mansion",
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
        "Act 2 Scene 1: Outside Capulet's mansion",
        "Act 2 Scene 2: Capulet's orchard",
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
        "Act 2 Scene 4: A street in Verona",
        "Act 2 Scene 5: Capulet's mansion",
        "Act 2 Scene 6: Friar Lawrence's cell"
    ]
    var act1SceneCount = 0
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1 ") {
            ++act1SceneCount
        }
    }
    print("There are \(act1SceneCount) scenes in Act 1")
    // prints "There are 5 scenes in Act 1"
    var mansionCount = 0
    var cellCount = 0
    for scene in romeoAndJuliet {
        if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
        }
    }
    print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
}

//MARK: Collection Types
func chapter4() {
    /*----------------array-------------------*/
    var someInts = [Int]()
    print("someInts is of type [Int] with \(someInts.count) items.")
    someInts.append(3)
    // someInts now contains 1 value of type Int
    someInts = []
    // someInts is now an empty array, but is still of type [Int]

    //Creating an Array with a Default Value
    var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
    //Creating an Array by Adding Two Arrays Together
    var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
    var sixDoubles = threeDoubles + anotherThreeDoubles //使用加号将两个数组组合起来
    
    //Creating an Array with an Array Literal字面量的方式创建数组
    var shoppingList = ["Eggs", "Milk"]
    
    //Accessing and Modifying an Array
    print(shoppingList.count)
    shoppingList.append("Flour")//添加一个元素
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    shoppingList[4...6] = ["Bananas", "Apples"]//使用下标来修改
    shoppingList.insert("Maple Syrup", atIndex: 0)//插入元素
    let mapleSyrup = shoppingList.removeAtIndex(0)//移除某个元素，返回移除的元素
    let apples = shoppingList.removeLast()//移除最后一个元素的简便方法
        
    for item in shoppingList {//两种遍历数组的方法
        print(item)
    }
    
    for (index, value) in shoppingList.enumerate() {
        print("item \(index) = \(value)")
    }
        
    /*----------------Sets-------------------*/
    //A set stores distinct values of the same type in a collection with no defined ordering.
    //All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default,
    //and can be used as set value types or dictionary key types.
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]//使用字面量的方式初始化set
    //Accessing and Modifying a Set
    print("I have \(favoriteGenres.count) favorite music genres.")
    //remove a item
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
        
    //check whether a set contains a particular item
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
        
    //Iterating(重复，迭代) Over a Set
    for genre in favoriteGenres {
        print("\(genre)")
    }
        
    //有序的遍历set
    for genre in favoriteGenres.sort() {
        print("\(genre)")
    }
        
    //Fundamental Set Operations
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    oddDigits.union(evenDigits).sort()//并集
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersect(evenDigits).sort()//交集
    // []
    oddDigits.subtract(singleDigitPrimeNumbers).sort()//去除交集之外的oddDigits的类容
    // [1, 9]
    oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()//去除交集之外的两个的类容
    // [1, 2, 9]
        
        
    /*----------------Dictionaries-------------------*/
    //A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
    //Creating an Empty Dictionary
    var namesOfIntegers = [Int: String]()//Dictionary<Key, Value>
    namesOfIntegers[16] = "sixteen"
    namesOfIntegers = [:]
    //Creating a Dictionary with a Dictionary Literal
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    //Accessing and Modifying a Dictionary
    airports["LHR"] = "London"//add a new
    airports["LHR"] = "London Heathrow"// change the old value
    //updateValue有旧值修改旧值并返回旧值，没有则添加新值返回nil
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
        
    airports["APL"] = "Apple International"
    airports["APL"] = nil //通过角标删除元素
    //删除元素，有则删除并返回旧值，没有返回nil
    if let removedValue = airports.removeValueForKey("DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary does not contain a value for DUB.")
    }
    //Iterating Over a Dictionary
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    for airportCode in airports.keys {
        print(airportCode)
    }
    for airportName in airports.values {
        print(airportName)
    }
        
    //字典里面的key或values取出来放到一个数组里面
    let airportCodes = [String](airports.keys)
    let airportNames = [String](airports.values)
    print(airportCodes)
    print(airportNames)
}

//MARK: Control Flow
func chapter5() {
    //For-In
    for index in 1...5 {
        print(index)
    }
    //遍历数组
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
    
    //while
    var index = 0
    repeat {//与do while一样
        index++
    } while index < 5
        
    //switch
    let someCharacter: Character = "e"
    switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
            "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) is not a vowel or a consonant")
    }
    
    //tuples
    let somePoint = (1, 1)
    switch somePoint {
        case (0, 0):
        print("(0, 0) is at the origin")
        case (_, 0):
        print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
    }
    //Value Bindings
    let anotherPoint = (0, 2)
    switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
    //where
    //A switch case can use a where clause to check for additional conditions
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("x == y")
    case let (x, y) where x < y:
        print("x < y")
    case let(x, y) where x > y:
        print("x > y")
    }
    
    //Control Transfer Statements
    //Labeled Statements continue和break都可以跳转到指定的标签
}

//MARK: Functions chapter6
func sayHello(personName: String) -> String {
        return "Hello" + personName;
}
print(sayHello("liuwei"))
//Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
            
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//Function Parameter Names,Specifying External Parameter Names
//If you provide an external parameter name for a parameter, 
//that external name must always be used when you call the function.
func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))
        
//Default Parameter Values
func someFunction(parameterWithDefault: Int = 12) {
// function body goes here
// if no arguments are passed to the function call,
// value of parameterWithDefault is 12
}
someFunction(6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12

//Variadic Parameters可变参数
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
        
//Constant and Variable Parameters
//Function parameters are constants by default. 第一个参数定义成变量，可以在函数内部修改
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
        
//In-Out Parameters
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)//调用的时候需要使用&
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//Nested Functions 内嵌函数
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//MARK: Closures
//Global and nested functions, as introduced in Functions, are actually special cases of closures. 
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
// The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.
var reversed = names.sort { (s1: String, s2: String) -> Bool in return s1 > s2}
//Inferring Type From Context因为是排序names所以可以自动推断出s1和s2的类型
reversed = names.sort({s1, s2 in return s1 > s2})
//只有一条语句的时候可以省略return
reversed = names.sort( { s1, s2 in s1 > s2 } )
//Shorthand Argument Names
reversed = names.sort({$0 > $1})
//Operator Functions
reversed = names.sort(>)
//Trailing Closures
//If you need to pass a closure expression to a function 
//as the function’s final argument and the closure expression is long,
//it can be useful to write it as a trailing closure instead.
reversed = names.sort() { $0 > $1 }
reversed = names.sort { $0 > $1 }//闭包是函数的唯一参数，且使用了Trailing Closures可以省略括号

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
print(strings)
//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    //nested捕获了包含它的函数的参数，和定义的变量
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
//Closures Are Reference Types
//Whenever you assign a function or a closure to a constant or a variable, 
//you are actually setting that constant or variable to be a reference to the function or closure.

//Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))//自动将参数转换为闭包
//func serveCustomer(@autoclosure customerProvider: () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//serveCustomer({ customersInLine.removeAtIndex(0) })

//MARK: Enumerations
enum CompassPoint {
    case North
    case South
    case East
    case West
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var directionToHead = CompassPoint.West
directionToHead = .East//自动推断了类型
//Associated Values
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFG")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer) \(product) \(check)")
case .QRCode(let productCode):
    print("QR code: \(productCode)")
}

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check)://当所有的参数都是let的时候，可以简写
    print("UPC-A: \(numberSystem), \(manufacturer) \(product) \(check)")
case let .QRCode(productCode):
    print("QR code: \(productCode)")
}
//Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//implicity Assigned Raw Values默认分配原始值
enum Planet1: Int {//不赋值默认从0开始
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
enum CompassPoint1: String {//原始值就是"North" "South" "East" "West"
    case North, South, East, West
}

//access a raw value
let earthsOrder = Planet1.Earth.rawValue
let sunsetDirection = CompassPoint1.East.rawValue
print("\(earthsOrder) \(sunsetDirection)")

//Initializing from a Raw Value
let possiblePlanet = Planet1(rawValue: 7)

//Recursive Enumerations递归枚举
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
indirect enum ArithmeticExpression1 {//上面的简便写法
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
//(5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))

//MARK: Classes and Structures
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//Memberwise Initializers for Structure Types,All structures have an automatically-generated memberwise initializer
let vga = Resolution(width: 640, height: 480)
//Structures and Enumerations Are Value Types 值传递
//A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.
//Classes Are Reference Types 引用传递，引用的是同一个实例
//Rather than a copy, a reference to the same existing instance is used instead.
let tenEighty = VideoMode()
tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0 //改变了原来的值
print(tenEighty.frameRate)

//Identity Operators ===, !== 用于判断是否是同一个实例
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//MARK: Properties
let Properties = {
    //Stored Properties
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int
    }
    //Lazy Stored Properties,value is not calculated until the first time it is used. 
    //变量才能定义为lazy，因为常量在定义的时候已经赋值了
    class DataImporter {
        var fileName = "data.txt"
    }
    class DataManager {
        lazy var importer = DataImporter()
        var data = [String]()
    }
    let manager = DataManager()
    manager.data.append("Some data")
    manager.data.append("Some more data")
    print(manager.importer.fileName)//直到这里DataImporter的初始化方法才被调用
    
    //Computed Properties
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
//            set(newCenter) {
//                origin.x = newCenter.x - (size.width / 2)
//                origin.y = newCenter.y - (size.height / 2)
//            }
            set {//使用默认的newValue
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
        }
    }
    var square = Rect(origin: Point(x: 0.0, y: 0.0),
        size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
    //Read-Only Computed Properties
    //A computed property with a getter but no setter is known as a read-only computed property.
    //只有个get方法，且get可以省略
    
    //Property Observers
    //Property observers are called every time a property’s value is set,
    //even if the new value is the same as the property’s current value.
    class StepCounter {
        var totalSteps: Int = 0 {
            willSet { //两个方法都可以对值进行控制，didSet设置的值会覆盖willSet设置的值
                print("About to set totalSteps to \(newValue)")
            }
            didSet {
                if totalSteps > oldValue {
                    print("Add \(totalSteps - oldValue) steps")
                }
            }
        }
    }
    let stepCounter = StepCounter()
    stepCounter.totalSteps = 200
    stepCounter.totalSteps = 360
    //Type Properties, ----> static
    struct SomeStructure {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 1
        }
    }
}

//MARK: Methods
class Counter {
    var count = 0
    func increment() {
        ++count
    }
    //Swift treats amount as a local name only, but treats numberOfTimes as both a local and an external name.
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5, numberOfTimes: 5)
counter.reset()

//Modifying Value Types from Within Instance Methods
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//Assigning to self Within a Mutating Method
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()// ovenLight is now equal to .High
ovenLight.next()// ovenLight is now equal to .Off

//Type Methods
//You indicate type methods by writing the static keyword before the method’s func keyword.
//Classes may also use the class keyword to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    class func someTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//MARK: Subscripts
struct TimesTable {
    let multiplier: Int
    //一个只读的下标脚本
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
//subscript也可以带多个参数
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    //subscript也可以带多个参数
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

//MARK: Inheritance
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        //do nothing
    }
}

class Bicycle: Vehicle {
    var hsaBasket = false
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

//overiding
//Accessing Superclass Methods, Properties, and Subscripts
//super.someMethod() super.someProperty super[someIndex]

//overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

//Overriding Properties
//继承下来的read-only property可以改写成读写的，继续的读写的属性不能改成只读的
//Overriding Property Getters and Setters
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
//Overriding Property Observers
//NOTE: 1.cannot add property observers to inherited constant stored properties or inherited read-only computed properties
//2.你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化,
//并且你已经为那个属性提供了定制的 setter,那么你在 setter 中就可以观察到任何值变化了。
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class mytest: AutomaticCar {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 2
        }
    }
}

//Preventing Overrides
//加final关键字，表示不能被继承或重写



























