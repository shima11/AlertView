//
//  MyAlertView.swift
//  AlertView
//
//  Created by shima jinsei on 2016/09/26.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

class MyAlertView: UIView {

    var containView: UIView?
    var titleLabel: UILabel?
    var messageLabel: UILabel?
    
    let screenSize = UIScreen.mainScreen().bounds.size
    let alertViewSize = CGSizeMake(280, 80)
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        print("draw rect")
    }
    
    
    convenience init() {
        print("convenience init")
        self.init(frame: UIScreen.mainScreen().bounds)
    }
    
    override init(frame: CGRect) {
        print("init frame")

        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // xib or storyboard から呼ばれたらエラーを出す
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        
        self.containView = UIView.init(frame: CGRectMake(screenSize.width/2 - alertViewSize.width/2, screenSize.height/2 - alertViewSize.height/2, alertViewSize.width, alertViewSize.height))
        self.containView?.backgroundColor = UIColor.whiteColor()
        self.containView?.layer.cornerRadius = 8.0
        self.addSubview(self.containView!)
        
        
        
    }

}
