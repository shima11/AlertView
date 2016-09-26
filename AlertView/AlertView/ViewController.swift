//
//  ViewController.swift
//  AlertView
//
//  Created by shima jinsei on 2016/09/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
//        let alertView = MyAlertView.init()
//        alertView.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
//        self.view.addSubview(alertView)
        
        // memo: viewdidloadでviewcontroller
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //MyAlertViewController.show(presentViewController: self, title: "タイトル", message: "メッセージを\n表示しています。")
        showAlert()
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func showAlert() {
        let alertViewController = UIAlertController(title: "Alert",
                                          message: "message",
                                          preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
                                                        style: UIAlertActionStyle.Cancel,
                                                        handler: {
                                                            (action:UIAlertAction!) -> Void in
                                                            print("Cancel")
        })
        let defaultAction: UIAlertAction = UIAlertAction(title: "Default",
                                                         style: UIAlertActionStyle.Default,
                                                         handler: {
                                                            (action: UIAlertAction!) -> Void in
                                                            print("Default")
        })
        let destructiveAction: UIAlertAction = UIAlertAction(title: "Destructive",
                                                             style: UIAlertActionStyle.Destructive,
                                                             handler: {
                                                                (action: UIAlertAction!) -> Void in
                                                                print("Destructive")
        })
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(defaultAction)
        alertViewController.addAction(destructiveAction)
        
        presentViewController(alertViewController, animated: true, completion: nil)
        
    }
}

