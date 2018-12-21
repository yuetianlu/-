//
//  Template.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 模板方法模式（Template Method）定义了一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重新定义该算法的某些特定步骤

// 定义了一套问题模板
class Question {
    final func question() {
        print("如果有一天，不写程序了，你会去做什么？")
        print("我会去\(answer())")
    }
    
    // 默认是养猪
    func answer() -> String {
        return "养猪"
    }
}

class PersonA: Question {
    override func answer() -> String {
        return "下海经商"
    }
}

class PersonB: Question {
    override func answer() -> String {
        return "自己开公司"
    }
}
