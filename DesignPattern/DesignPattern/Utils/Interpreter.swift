//
//  Interpreter.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 解释器模式（Interpreter）给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子

// 定义一个新的语法，用字符表示，解释“1+2”这个字符串的含义
protocol Interpreter {
    // 返回一个泛型Result
    static func interpreter<Result>(input: String) -> Result
}

// 整型解释器
struct IntInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (Int(arr.first!)! + Int(arr.last!)!) as! Result
    }
}

// 字符解析器
struct StringInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (arr.first! + arr.last!) as! Result
    }
}
