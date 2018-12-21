//
//  Decorator.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 装饰模式（Decorator），动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活

protocol Phone {
    func call() -> String
    func video() -> String
}

class iPhone: Phone {
    func call() -> String {
        return "苹果打电话"
    }
    
    func video() -> String {
        return "苹果看电影"
    }
}

// 父装饰器
class PhoneDecorator: Phone {
    var phone: Phone
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    func call() -> String {
        return phone.call()
    }
    
    func video() -> String {
        return phone.video()
    }
}

// 增加流量功能

class PhoneDecoratorNet: PhoneDecorator {
    override func call() -> String {
        return "流量-\(phone.call())"
    }
    
    override func video() -> String {
        return "流量-\(phone.video())"
    }
}

// 增加wifi功能
class PhoneDecoratorWifi: PhoneDecorator {
    
    override func call() -> String {
        return "wifi-\(phone.call())"
    }
    
    override func video() -> String {
        return "wifi-\(phone.video())"
    }
}


