//
//  Visitor.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 访问者模式（Visitor）表示一个作用于某对象结构中的各元素的操作。它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作

// 假设一个人要去访问朋友ABCD
// 访客协议
protocol VisitorProtocol {
    func visit(_ planet: FriendA)
    func visit(_ planet: FriendB)
    func visit(_ planet: FriendC)
    func visit(_ planet: FriendD)
}

// 朋友的协议
protocol FriendProtocol {
    func accept(_ visitor: VisitorProtocol)
}

// A
class FriendA: FriendProtocol {
    func accept(_ visitor: VisitorProtocol) {
        visitor.visit(self)
    }
}
// B
class FriendB: FriendProtocol {
    func accept(_ visitor: VisitorProtocol) {
        visitor.visit(self)
    }
}
// C
class FriendC: FriendProtocol {
    func accept(_ visitor: VisitorProtocol) {
        visitor.visit(self)
    }
}
// D
class FriendD: FriendProtocol {
    func accept(_ visitor: VisitorProtocol) {
        visitor.visit(self)
    }
}
// 访客
class Visitor: VisitorProtocol {
    var address = ""
    func visit(_ planet: FriendA) {
        address = "访问了朋友A"
    }
    func visit(_ planet: FriendB) {
        address = "访问了朋友B"
    }
    func visit(_ planet: FriendC) {
        address = "访问了朋友C"
    }
    func visit(_ planet: FriendD) {
        address = "访问了朋友D"
    }
}
