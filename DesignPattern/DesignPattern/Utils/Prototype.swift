//
//  Prototype.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 原型模式（Prototype） 用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。

// 定义了一个程序员原型，假设有一大批程序员，他们之间的区别就是姓名不同，其余都相同

class Programmer {
    var name: String?
    var age: Int
    var sex: String
    var language: String
    
    init(age: Int, sex: String, language: String) {
        self.sex = sex
        self.age = age
        self.language = language
    }
    
    // 可以克隆自己
    func clone() -> Programmer {
        return Programmer(age: age, sex: sex, language: language)
    }
}
