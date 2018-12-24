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
        // 抽象工厂模式
        abstractFactory()
        // 状态模式
        state()
        // 适配器模式
        adpater()
        // 备忘录模式
        memento()
        // 组合模式
        composite()
        // 迭代器模式
        iterator()
        // 单例模式
        singleton()
        // 桥接模式
        bridge()
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
    
    // 抽象工厂模式
    func abstractFactory() {
        let tv = AbstractFactory.createPruduct(.Television)
        let bx = AbstractFactory.createPruduct(.Refrigerator)
        tv.showYouself()
        bx.showYouself()
    }
    
    // 状态模式
    func state() {
        let happy = State(mood: .happy)
        let programmer = ProgrammerA(happy)
        programmer.programming()
        
        let sad = State(mood: .sad)
        programmer.state = sad
        programmer.programming()
        
        let normal = State(mood: .normal)
        programmer.state = normal
        programmer.programming()
    }
    
    // 适配器模式
    func adpater() {
        let gameA = GameA()
        let gameB = GameB()
        let adapterA = AdapterGameA(gameA)
        let adapterB = AdapterGameB(gameB)
        adapterA.a()
        adapterA.s()
        adapterA.d()
        adapterA.w()
        
        adapterB.a()
        adapterB.s()
        adapterB.d()
        adapterB.w()
    }
    
    // 备忘录模式
    func memento() {
        let state = RollState(life: 100, blue: 100) // 初始化角色
        let roll = Roll(state)
        
        let mementoState = roll.saveState()
        
        print(dump(roll))
        
        roll.kill()
        print(dump(roll))
        
        roll.restoreState(mementoState)
        print(dump(roll))
    }
    
    // 组合模式
    func composite() {
        // 单个对象可以单独使用draw函数，也可以组合到一起，使用组合后的draw
        let a = Circle()
        let b = Square()
        let c = Triangle()
        
        a.draw()
        b.draw()
        c.draw()
        
        let p = Print()
        p.addDrawer(a, b, c)
        p.draw()
    }
    
    // 迭代器模式
    func iterator() {
        let algorithm: Algorithm = Algorithm(index:10)
        
        var iterator = algorithm.makeIterator()
        for _ in 1...10 {
            print((iterator.next()?.index)!)
        }
    }
    
    // 单例模式
    func singleton() {
        let single = Singleton.share
        
        print(single.index)
        single.index = 100
        print(single.index)
        
        print(Singleton.share.index)
    }
    
    // 桥接模式
    func bridge() {
        let map = Map()
        let camera = Camera()
        
        // 把对应app给控制类，运行控制类的抽象接口m，则会运行app的接口实现
        let control = Control(map)
        control.open() // 打开地图
        control.app = camera
        control.open()
    }
}

