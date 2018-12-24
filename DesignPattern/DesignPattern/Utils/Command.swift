//
//  Command.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 命令模式（Command）将一个请求封装成一个对象，从而使你可用不同的请求对客户进行参数化，对请求排队或记录请求日志，以及支持可撤销的操作

enum DoorActionType{
    case open
    case close
    case lock
    case unlock
}

// 命令协议，命令需要实现execute方法
protocol CommandProtocol {
    func execute()
}

// 门
struct Doors {
    var name: String
}

// 门可以执行的操作：开门、关门、上锁、解锁
class DoorAction: CommandProtocol {
    var actionType: DoorActionType
    var door: Doors
    
    init(_ type: DoorActionType, door: Doors) {
        actionType = type
        self.door = door
    }
    
    func execute() {
        switch actionType {
        case .open:
            print("\(door.name)执行开门命令!")
        case .close:
            print("\(door.name)执行关门命令！")
        case .lock:
            print("\(door.name)执行上锁命令！")
        case .unlock:
            print("\(door.name)执行解锁命令！")
        }
    }
}
// 命令管理者
class DoorManager {
    var actions = [CommandProtocol]()
    // 添加命令
    func add(_ actions: CommandProtocol...) {
        self.actions = actions
    }
    
    // 执行命令
    func execute() {
        _ = actions.map{$0.execute()}
    }
}
