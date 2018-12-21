//
//  Builder.swift
//  DesignPattern
//
//  Created by yuetianlu on 2018/12/21.
//  Copyright © 2018年 yuetianlu. All rights reserved.
//

import Foundation
import UIKit
// 建造者模式（Builder） 将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示

// 创建对象需要的表示，需要用户自己定制
struct LabelBuilder {
    var text: String
    var color: UIColor
    var rect: CGRect
}

// 对象的构建，需要传入表示
class LabelDirector {
    static func createLableWithBuilder(builder: LabelBuilder) -> UILabel {
        let label = UILabel(frame: builder.rect)
        label.text = builder.text
        label.textColor = builder.color
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }
}
