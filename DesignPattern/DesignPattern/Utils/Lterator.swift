//
//  Lterator.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 迭代器模式（lterator）提供一种方法顺序访问一个聚合对象中的各个元素，而又不暴露该对象的内部表示

// 定义了一个算法，利用迭代器后，会依次输出结果

struct Algorithm {
    var index: Int
}

// 定义了该算法的迭代器
struct AlgorithmItertor: IteratorProtocol {
    private var current = 1
    var begin: Int
    init(_ begin: Int) {
        self.begin = begin
    }
    
    mutating func next() -> Algorithm? {
        defer {
            current += 1;
        }
        return Algorithm(index: current * begin)
    }
}

// 扩展了该算法，增加一个迭代器方法
extension Algorithm: Sequence {
    func makeIterator() -> AlgorithmItertor {
        return AlgorithmItertor(index)
    }
}
