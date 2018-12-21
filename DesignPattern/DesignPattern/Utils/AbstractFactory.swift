//
//  AbstractFactory.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 抽象工厂模式（Abstract Factory）提供一个创建一系列相关或相互依赖对象的接口，而无需指定他们具体的类

// 产品
protocol ProductProtocol {
    var factory: String { get set }
    func showYouself()
}

struct Television: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的电视")
    }
}

struct Refrigerator: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的冰箱")
    }
}

enum ProductType {
    case Television
    case Refrigerator
}

class AbstractFactory {
    static func createPruduct(_ type: ProductType) -> ProductProtocol {
        switch type {
        case .Television:
            return Television(factory: "工厂")
        case .Refrigerator:
            return Refrigerator(factory: "工厂")
        }
    }
}
