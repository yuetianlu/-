//
//  Mediator.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 中介者模式（Mediator）用于一个中介对象来封装一系列的对象交互。中介者使各对象不需要显示地相互引用，从而使其耦合松散，而且可以独立的改变他们之间的交互

// 制造协议
protocol CreateProtocol {
    var name: String {get set}
    func create() -> Any
}

// 钢铁
struct Steel {
    var name: String
    var createFrom: String
}

// 机器人结构体
struct Robots {
    var name: String
    var steel: Steel
    var createFrom: String
}

// 优质造铁厂
class SteelFactory: CreateProtocol {
    var name: String
    init(_ name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "优质钢材", createFrom: name)
    }
}

// 劣质造铁厂
class SteelFactoryLow: CreateProtocol {
    var name: String
    init(_ name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "劣质钢材", createFrom: name)
    }
}

// 制造机器人的公司
class RobotCompany: CreateProtocol {
    var mediator: Mediator
    var name: String
    init(_ mediator: Mediator, name: String) {
        self.mediator = mediator
        self.name = name
    }
    
    // 机器人制造公司需要钢材，然后向中介者要钢材，中介者去向工厂要。中介者和工厂没有互相引用，工厂可以替换
    func create() -> Any {
        return Robots(name: "阿狸机器人", steel: mediator.needSteel(), createFrom: name)
    }
}

// 中介者
class Mediator {
    var steelFactory: CreateProtocol
    init(_ steelFact: SteelFactory) {
        self.steelFactory = steelFact
    }
    // 向中介者要钢材
    func needSteel() -> Steel {
        return steelFactory.create() as! Steel
    }
}
