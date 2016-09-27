//
//  Shakeable.swift
//  AlertView
//
//  Created by shima jinsei on 2016/09/27.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

protocol Shakeable {}

extension Shakeable where Self: UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 4.0, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 4.0, self.center.y))
        self.layer.addAnimation(animation, forKey: "position")
    }
}