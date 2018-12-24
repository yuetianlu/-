//
//  ChainOfResponsibility.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/24.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation

// 职责链模式（chain of responsibility）使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这个对象连成一条链，并沿着这条链传递该请求，指导有一个对象处理它为止

// 问题协议
protocol QuestionProtocol {
    // 指定自己回答不出来，下一个回答的人
    var next: QuestionProtocol? {get set}
    // 该方法用于问问题
    func answerQuestion(_ question: String)
}

struct Student: QuestionProtocol {
    var name: String
    var canAnswerQuestion: String
    var next: QuestionProtocol?
    func answerQuestion(_ question: String) {
        switch question {
        case canAnswerQuestion:
            print("\(name)回答： 1 + 1 = 2")
        case canAnswerQuestion:
            print("\(name)回答： 1 * 2 = 2")
        case canAnswerQuestion:
            print("\(name)回答： 2 * 2 = 4")
        case canAnswerQuestion:
            print("\(name)回答： 3 * 2 = 5")
        default:
            if let next = next {
                next.answerQuestion(question)
            } else {
                print("这个问题没人知道答案")
            }
        }
    }
}
