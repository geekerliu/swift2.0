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

chapter2()


