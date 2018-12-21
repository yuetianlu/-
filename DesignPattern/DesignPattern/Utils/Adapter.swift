//
//  Adapter.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 适配器模式（Adapter）将一个类的接口转换成客户希望的另外一个接口。Adapter模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作

// 假如游戏a中，asdw分别代表游戏角色 左下右上移动，但是在游戏b中，asdw分别代表 左 蹲下 跳跃 右 的动作，此时，适配器模式就体现出用途了，游戏b写一个适配器即可使用asdw按键
// 游戏协议，分别定义出asdw四个键按下后需要实现的方法

protocol AdapterProtocol {
    func a()
    func s()
    func d()
    func w()
}

// 游戏对应的适配器
class AdapterGameA: AdapterProtocol {
    var game: GameA
    init(_ game: GameA) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.down()
    }
    func d() {
        game.right()
    }
    func w() {
        game.up()
    }
}

class AdapterGameB: AdapterProtocol {
    var game: GameB
    
    init(_ game: GameB) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.squat()
    }
    func d() {
        game.right()
    }
    func w() {
        game.jump()
    }
}

class GameA {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func down() {
        print("\(String(describing: self))下移动游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func up() {
        print("\(String(describing: self))上移动游戏角色")
    }
}

class GameB {
    func left() {
         print("\(String(describing: self))左移动游戏角色")
    }
    func squat() {
        print("\(String(describing: self))蹲下游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func jump() {
        print("\(String(describing: self))跳起游戏角色")
    }
}
