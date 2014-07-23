//
//  ResultViewController.swift
//  RestClient
//
//  Created by YourtionGuo on 7/22/14.
//  Copyright (c) 2014 yourtion. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultText: UITextView!
    
    var requestParams = Array<Array<String>>()
    var requestUrl = String()
    var requestMethod = String()
    var paramDic = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Result"
        self.resultText.text = self.requestUrl
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
