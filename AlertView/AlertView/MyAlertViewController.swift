//
//  MyAlertViewController.swift
//  AlertView
//
//  Created by shima jinsei on 2016/09/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

class MyAlertViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet var singleButtonView: UIView!
    @IBOutlet var doubleButtonView: UIView!
    
    @IBOutlet weak var singleAcceptButton: UIButton!
    @IBOutlet weak var doubleCancelButton: UIButton!
    @IBOutlet weak var doubleAcceptButton: UIButton!
    
    var titleText: String = ""
    var messageText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.4)
        
        self.singleAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), forControlEvents: .TouchUpInside)
        self.doubleAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), forControlEvents: .TouchUpInside)
        self.doubleCancelButton.addTarget(self, action: #selector(cancelButtonTapped), forControlEvents: .TouchUpInside)
        
        
        titleLabel.text = titleText
        messageLabel.text = messageText
        
        addSingleBUtton(title: titleText)
        
    }
    
    func addSingleBUtton(title title:String) {
        singleButtonView.frame.origin = CGPoint(x: 0, y: 120)
        contentView.addSubview(singleButtonView)
        singleAcceptButton.setTitle(title, forState: .Normal)
        
    }
    
    
}

// button action
extension MyAlertViewController {
    func acceptButtonTapped (){
        print("accept button tapped")
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    func cancelButtonTapped (){
        print("cancel button tapped")
    }
}

// show
extension MyAlertViewController {
    class func show(presentViewController vc: UIViewController, title: String, message: String) {
        guard let alert = UIStoryboard(name: "MyAlertViewController", bundle: nil).instantiateInitialViewController() as? MyAlertViewController else { return }
        alert.titleText = title
        alert.messageText = message
        vc.presentViewController(alert, animated: false, completion: nil)
    }
}
