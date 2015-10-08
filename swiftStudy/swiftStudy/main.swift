//
//  main.swift
//  swiftStudy
//
//  Created by LiuWei on 15/10/8.
//  Copyright © 2015年 AppCoda. All rights reserved.
//

// Swift2.0学习：基础部本
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

// 基本运算符
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

//Strings and Characters
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

chapter3()


