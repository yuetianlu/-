//
//  ViewController.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 策略模式
        strategy()
        // 装饰模式
        decorator()
        // 代理模式
        proxy()
        // 工厂模式
        factory()
        // 原型模式
        prototype()
        // 模板方法
        template()
        // 外观模式
        facade()
        // 建造者模式
        builder()
        // 观察者模式
        observer()
    }
    
    // 策略模式
    func strategy() {
        let normal = CashContext(type: .Normal)
        print("Normal结果:\(normal.getResult(money: 100))")
        
        let robate = CashContext(type: .Robate)
        print("Robate结果:\(robate.getResult(money: 100))")
        
        let retur = CashContext(type: .Return)
        print("Return结果:\(retur.getResult(money: 100))")
    }
    
    // 装饰模式
    func decorator() {
        let phone = iPhone()
        
        // 装饰器增加了功能
        var decorator = PhoneDecorator(phone: phone)
        print(decorator.call())
        print(decorator.video())
        
        decorator = PhoneDecoratorNet(phone: phone)
        print(decorator.call())
        print(decorator.video())
        
        decorator = PhoneDecoratorWifi(phone: phone)
        print(decorator.call())
        print(decorator.video())
    }
    
    // 代理模式
    func proxy() {
        // 虚拟代理，youth控制了child的行为
        let virtual = Youth()
        virtual.run()
        virtual.cry()
        
        // 保护代理，对于控制孩子开门的h这个行为，增加了一个保护，如果没有孩子这个实例，则自己去出门
        let parent = Parent()
        parent.open()
        parent.haveChild(have: true)
        parent.open()
    }
    
    // 工厂方法模式
    func factory() {
        // 不同的工厂子类决定了要生成的实例
        var factory: Factory = ChangHoneFactory()
        print("创建出了:\(factory.createProduct())")
        
        factory = HaierFactory()
        print("创建出了:\(factory.createProduct())")
    }
    
    // 原型模式
    func prototype(){
        let a = Programmer(age: 18, sex: "M", language: "swift")
        a.name = "李雷"
        print(dump(a))
        
        let b = a.clone()
        b.name = "韩梅梅"
        print(dump(b))
    }
    
    // 模板方法
    func template() {
        let s = Question()
        s.question()
        
        let a = PersonA()
        a.question()
        
        let b = PersonB()
        b.question()
    }
    
    // 外观模式
    func facade() {
        Robot.createRobot()
    }
    
    // 建造者模式
    func builder() {
        let builder = LabelBuilder.init(text: "建造者", color: .red, rect: CGRect(x: 100, y: 100, width: view.frame.width - 200, height: 30))
        let label = LabelDirector.createLableWithBuilder(builder: builder)
        view.addSubview(label)
    }
    
    // 观察者模式
    func observer() {
        let staff = Staff()
        let staffA = StaffA()
        let staffB = StaffB()
        
        let reception = Reception()
        reception.observers = [staff, staffA, staffB]
        
        reception.noticeLev1()
        reception.noticeLev2()
    }
}

