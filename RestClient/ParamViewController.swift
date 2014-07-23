//
//  ParamViewController.swift
//  RestClient
//
//  Created by YourtionGuo on 7/22/14.
//  Copyright (c) 2014 yourtion. All rights reserved.
//

import UIKit

class ParamViewController: UIViewController {

    @IBOutlet var paramKey: UITextField!
    @IBOutlet var paramValue: UITextView!
    @IBOutlet var doneBtn: UIBarButtonItem!
    
    var param = []
    var edit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Param"
    }
    
    override func viewWillAppear(animated: Bool) {
        if (self.param.count > 0){
            self.paramKey.text = self.param[0] as String
            self.paramValue.text = self.param[1] as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneParam(sender: UIBarButtonItem) {
        if (self.paramKey.hasText() && self.paramValue.hasText()){
            println("Done")
            let requestView:RequestViewController = self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2] as RequestViewController
            if (edit){
                requestView.params[requestView.editingIndex] = [self.paramKey.text,self.paramValue.text]
            }else{
                requestView.params.append([self.paramKey.text,self.paramValue.text])
            }
            requestView.paramTable.reloadData()
            self.navigationController.popViewControllerAnimated(true)
        }
    }

}
