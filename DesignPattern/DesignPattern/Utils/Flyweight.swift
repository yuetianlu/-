//
//  Flyweight.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 享元模式(Flyweight) 运用共享技术有效的支持大量细粒度的对象

// 假设有一家杂货店，一开始老板不知道卖什么，有人来买，马上就制造，进货后就不会缺货，就可以使用享元模式，将有人买过的东西保存起来共享，再有人买直接拿出来，不用再去进新的货

// 商品
struct Commodity: CustomStringConvertible {//CustomStringConvertible该协议能够使自定义输出实例的description
    var commodity: String
    var description: String {
        get {
            return "商品名称："+commodity
        }
    }
}
// 杂货店
class GroceryStore {
    // 商品
    private var list = [String:Commodity]()
    func buyCommodity(_ name: String) -> Commodity {
        if !list.keys.contains(name) {
            print("没有货，制造")
            list[name] = Commodity(commodity: name)
        } else {
            print("有货，直接拿")
        }
        return list[name]!
    }
}
