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

func chapter2() {
    
}

chapter2()


