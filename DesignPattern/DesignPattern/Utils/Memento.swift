//
//  Memento.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 备忘录模式（Momonto）,在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样以后就可以将该对象恢复到原先保存的状态

// 假设一款游戏里，一个角色有生命，蓝量两个状态，当用户要打boss前，可以先备份一下，打之前状态，发现打不过时，可以重新开始，从头打boss

struct RollState {
    var life: Int
    var blue: Int
}

class Roll {
    var state: RollState
    init(_ state: RollState) {
        self.state = state
    }
    
    func saveState() -> RollState {
        return state
    }
    
    func restoreState(_ state: RollState) {
        self.state = state
    }
    
    func kill() {
        state.life = 0
        state.blue = 0
    }
}
