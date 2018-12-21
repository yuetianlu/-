//
//  Strategy.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

/**
  策略模式：定义了算法家族，分别封装起来，让他们之间可以互相替换，此模式让算法的变化，不会影响到使用算法的用户
 */
import Foundation
import UIKit

// 定义了金钱的算法acceptcash，分别实现
protocol CashBase {
    func acceptcash(cash: CGFloat) -> CGFloat
}

// 正常
class CashNormal: CashBase {
    func acceptcash(cash: CGFloat) -> CGFloat {
        return cash
    }
}

// 打折
class CashRobate: CashBase {
    var moneyRobate: CGFloat
    init(robate: CGFloat) {
        moneyRobate = robate
    }
    func acceptcash(cash: CGFloat) -> CGFloat {
        return cash * moneyRobate
    }
}

// 减免
class CashReturn: CashBase {
    var moneyReturn: CGFloat
    init(retur: CGFloat) {
        moneyReturn = retur
    }
    func acceptcash(cash: CGFloat) -> CGFloat {
        return cash - moneyReturn
    }
}

enum CashType {
    case Normal
    case Robate
    case Return
}

class CashContext {
    var cashBase: CashBase
    init(type: CashType) {
        switch type {
        case .Normal:
            cashBase = CashNormal()
        case .Robate:
            cashBase = CashRobate(robate: 0.5)
        case .Return:
            cashBase = CashReturn(retur: 10)
        }
    }
    
    func getResult(money: CGFloat) -> CGFloat{
        return cashBase.acceptcash(cash:money)
    }
}
