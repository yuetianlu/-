//
//  Proxy.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 代理模式， 为其他对象提供一种代理以控制对这个对象的访问

// 虚拟代理
protocol Action {
    func run()
    func cry()
}

class Children: Action {
    func run() {
        print("孩子跑了")
    }
    func cry() {
        print("孩子哭了")
    }
}

class Youth: Action {
    lazy private var children: Children = Children()
    
    func run() {
        children.run()
    }
    
    func cry() {
        children.cry()
    }
}

// 保护代理
protocol Door {
    func open()
}
class Child: Door {
    func open() {
        print("好的，马上来开门")
    }
}

class Parent: Door {
    private var child: Child!
    
    func haveChild(have: Bool) {
        guard have else{
            return
        }
        child = Child()
    }
    
    func open() {
        guard child != nil else {
            print("没有孩子，我自己来开门")
            return
        }
        child.open()
    }
}
