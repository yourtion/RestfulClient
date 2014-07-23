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
    var data: NSMutableData = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Result"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startRequest() {
        var url = NSURL(string: requestUrl)
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        let queue = NSOperationQueue()
        let completion = { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let res = response as NSHTTPURLResponse!
            if (error) {
                println(error)
                return
            }
            var error: NSError?
            var respon: AnyObject!
            if (data) {
                respon = NSString(data: data, encoding: UInt())
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.resultText.text = respon as String
            })
        }
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: completion)
    }
}
