//
//  Composite.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 组合模式（Composite）， 将对象组合成树形结构以表示“部分-整体”的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性

// 画图案的协议
protocol DrawProtocol {
    func draw()
}

class Circle: DrawProtocol {
    func draw() {
        print("我负责画圆")
    }
}

class Square: DrawProtocol {
    func draw() {
        print("我负责画方形")
    }
}

class Triangle: DrawProtocol {
    func draw() {
        print("我负责画三角形")
    }
}

class Print: DrawProtocol {
    var drawer = [DrawProtocol]()
    
    func addDrawer(_ drawer: DrawProtocol...) {
        self.drawer.append(contentsOf: drawer)
    }
    
    func draw() {
        _ = drawer.map{$0.draw()}
    }
}
