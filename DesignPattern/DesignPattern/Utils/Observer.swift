//
//  Observer.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 观察者模式（Observer）定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主体对象。让这个主题对象在状态发生变化时，会通知所有观察者对象，使它们自己能够自动更新自己

enum NoticeType {
    case Lev1 // 到公司门口了
    case Lev2 // 进来办公室了
}

protocol ObserverProtocol {
    // 定义了一个协议、实现
    func notice(_ type: NoticeType)
}

class Reception {
    var observers: [ObserverProtocol]?
    
    func noticeLev1() {
        noticeEveryOne(lev: .Lev1)
    }
    
    func noticeLev2() {
        noticeEveryOne(lev: .Lev2)
    }
    
    func noticeEveryOne(lev: NoticeType) {
        for obj in observers! {
            obj.notice(lev)
        }
    }
}

// 好员工
class Staff: ObserverProtocol {
    func notice(_ type: NoticeType) {
        print("员工\(String(describing: self))说：老板来了就来了呗，一直在专心工作")
    }
}

// 员工A
class StaffA: Staff {
    
    override func notice(_ type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：不怕，继续看动画")
        default:
            print("员工\(String(describing: self))说：不怕，我是老板侄儿，他不会骂我的")
        }
    }
}

// 员工B
class StaffB: Staff {
    
    override func notice(_ type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：赶紧关了，打开Xcode")
        default:
            print("员工\(String(describing: self))说：嗯，这电脑，还好老板一进来就打开了")
        }
    }
}
