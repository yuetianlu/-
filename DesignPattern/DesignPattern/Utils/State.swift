//
//  State.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 状态模式(State) 当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类

enum MoodState {
    case happy
    case sad
    case normal
}

// 状态
struct State {
    var mood: MoodState
}

// 一个程序员
class ProgrammerA {
    var state: State
    init(_ state: State) {
        self.state = state
    }
    
    func programming() {
        switch state.mood {
        case .happy:
            print("心情不错，开心的写程序")
        case .sad:
            print("心情糟糕，不想写程序")
        case .normal:
            print("心情正常，慢慢悠悠的写程序")
        }
    }
}
