//
//  ViewController.swift
//  AlertView
//
//  Created by shima jinsei on 2016/09/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

extension UITextField: Shakeable {}

class ViewController: UIViewController {

    let maxTextLenge: Int = 6 // 最大入力文字数
    
    var alertViewController: UIAlertController?
    let defaultMessage = "default message"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //MyAlertViewController.show(presentViewController: self, title: "タイトル", message: "メッセージを\n表示しています。")

        showAlert()
        //showActionSheet()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func showAlert() {
        // alertviewcontroller作成
        alertViewController = UIAlertController(title: "Alert",
                                          message: defaultMessage,
                                          preferredStyle: .Alert)
        alertViewController!.view.backgroundColor = UIColor.redColor()
        
        addAlertAction()
        addTextField()
        
        // alertviewcontrollerを画面に表示
        presentViewController(alertViewController!, animated: true, completion: nil)
    }
    
    func addAlertAction() {
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
                                                        style: UIAlertActionStyle.Cancel,
                                                        handler: {(action:UIAlertAction!) -> Void in
                                                            print("Cancel")
        })
        let defaultAction: UIAlertAction = UIAlertAction(title: "Default",
                                                         style: UIAlertActionStyle.Default,
                                                         handler: {(action: UIAlertAction!) -> Void in
                                                            print("Default")
                                                            // textfieldの入力文字を取得
                                                            if let textFields = self.alertViewController!.textFields as Array<UITextField>? {
                                                                for textField:UITextField in textFields {
                                                                    print("\(textField.text)")
                                                                }
                                                            }
        })
        //defaultAction.enabled = false
        let destructiveAction: UIAlertAction = UIAlertAction(title: "Destructive",
                                                             style: UIAlertActionStyle.Destructive,
                                                             handler: {(action: UIAlertAction!) -> Void in
                                                                print("Destructive")
        })
        
         // actionをalertviewcontrollerに追加
        alertViewController!.addAction(cancelAction)
        alertViewController!.addAction(defaultAction)
        alertViewController!.addAction(destructiveAction)
    }
    
    func addTextField() {
        // textfieldをalertviewcontrollerに追加
        alertViewController!.addTextFieldWithConfigurationHandler({(textField: UITextField) -> Void in
            textField.placeholder = "user id"
            textField.keyboardType = .Default
            textField.delegate = self
            textField.clearButtonMode = UITextFieldViewMode.WhileEditing // 編集中のみクリアボタンを表示
            // notification centerに登録
            //            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.changeTextFieldText), name: UITextFieldTextDidChangeNotification, object: nil)
        })
        alertViewController!.addTextFieldWithConfigurationHandler({(textField: UITextField) -> Void in
            textField.placeholder = "password"
            textField.keyboardType = .Default
            textField.secureTextEntry = true
            textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        })
    }
    // textfieldの値が変化した時に呼ばれる (NSNotificationCenter UITextField)
    func changeTextFieldText(sender: NSNotification) {
        let textField = sender.object as! UITextField
        
        if textField.text?.characters.count < maxTextLenge {
            textField.enabled = true
            print (textField.text)
        }else {
            textField.enabled = false
            textField.text = ""
            print("入力文字数を超えています")
            // view shakable (ブルブルさせるアニメーション)
            
        }
    }
    
    func showActionSheet() {
        let acshonSheet = UIAlertController(title: "ActoinSheet",
                                            message: "message",
                                            preferredStyle: .ActionSheet)
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
        acshonSheet.addAction(cancelAction)
        acshonSheet.addAction(defaultAction)
        acshonSheet.addAction(destructiveAction)
        
        presentViewController(acshonSheet, animated: true, completion: nil)
        
    }
    
}


extension ViewController: UITextFieldDelegate {
    // UITextField.textが変更されたときに呼ばれる
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // 入力文字数を制限
        let text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        if text.characters.count > maxTextLenge {
            self.alertViewController!.message = defaultMessage + "\n入力文字数を超えています"
            // view shakable (ブルブルさせるアニメーション)
            textField.shake()
            return false
        } else {
            self.alertViewController!.message = self.defaultMessage
        }
        
        // defaultボタンをtextfieldに文字が入力されるとタップ可能にする
//        let defaultAction = self.alertViewController!.actions[0]
//        defaultAction.enabled = true
//        defaultAction.enabled = text.characters.count > 0 ? true : false
        
        
        print(textField.text)

        return true
    }
}

extension UIView {
    
}
