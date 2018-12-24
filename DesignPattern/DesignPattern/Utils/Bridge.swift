//
//  Bridge.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 桥接模式（bridge）将抽象部分与实现部分分离，使它们可以独立化

// 接口协议
protocol InterfaceProtocol {
    var app: RealizeProtocol {get set}
    func open()
}

// 实现协议
protocol RealizeProtocol {
    func appOpen()
}

// 操作类
class Control: InterfaceProtocol {
    var app: RealizeProtocol
    init(_ app: RealizeProtocol) {
        self.app = app
    }
    func open() {
        app.appOpen()
    }
}

// 地图
class Map: RealizeProtocol {
    func appOpen() {
        print("打开地图，开始定位！")
    }
}

// 相机
class Camera: RealizeProtocol {
    func appOpen() {
        print("打开摄像头，开始拍照！")
    }
}
