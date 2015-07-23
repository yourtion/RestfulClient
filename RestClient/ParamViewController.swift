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

        navigationItem.title = "Param"
    }
    
    override func viewWillAppear(animated: Bool) {
        if (param.count > 0){
            paramKey.text = param[0] as? String
            paramValue.text = param[1] as! String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneParam(sender: UIBarButtonItem) {
        if (paramKey.hasText() && paramValue.hasText()){
            print("Done")
            let requestView:RequestViewController = navigationController!.viewControllers[navigationController!.viewControllers.count - 2] as! RequestViewController
            let key :String = paramKey.text!
            let value :String = paramValue.text!
            if (edit){
                requestView.params[requestView.editingIndex] = [key, value]
            }else{
                requestView.params.append([key, value])
            }
            requestView.paramTable.reloadData()
            navigationController!.popViewControllerAnimated(true)
        }
    }

}
