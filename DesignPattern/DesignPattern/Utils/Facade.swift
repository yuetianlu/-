//
//  Facade.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 外观模式(Facade), 为子系统中的一组接口提供一个一致的页面，此模式定义了一个高层接口，这个接口使得这一子系统更加容易使用

class Robot {
    static func createRobot() {
        Head.createHead()
        Body.createBody()
        Arm.createArm()
        Leg.createLeg()
    }
}

class Head {
    static func createHead() {
        print("制造头")
    }
}

class Body {
    static func createBody() {
        print("制造身体")
    }
}

class Arm {
    static func createArm() {
        print("制造手臂")
    }
}

class Leg {
    static func createLeg() {
        print("制造腿")
    }
}
