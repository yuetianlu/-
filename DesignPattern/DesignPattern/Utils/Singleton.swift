//
//  Singleton.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 单例模式（Singleton）保证一个类仅有一个实例，并提供一个访问它的全局访问点

class Singleton {
    var index = 0
    static let share = Singleton()
    private init(){}
}
