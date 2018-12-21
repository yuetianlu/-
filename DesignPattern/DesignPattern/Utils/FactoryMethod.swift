//
//  FactoryMethod.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 工厂方法模式（Factory Method），定义了一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例化延迟到子类。

// 定义一个总的工厂类，让其子类决定创建出什么样的对象
class Factory {
    func createProduct() -> String {
        return "电视"
    }
}

class ChangHoneFactory: Factory {
    override func createProduct() -> String {
        return "长虹电视"
    }
}

class HaierFactory: Factory {
    override func createProduct() -> String {
        return "海尔电视"
    }
}
