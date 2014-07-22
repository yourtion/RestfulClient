//
//  RequestViewController.swift
//  RestClient
//
//  Created by YourtionGuo on 7/22/14.
//  Copyright (c) 2014 yourtion. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var paramaTable: UITableView!
    @IBOutlet var editParama: UIButton!
    @IBOutlet var requestURL: UITextField!
    @IBOutlet var requestAction: UISegmentedControl!
    
    var parama:NSMutableArray! = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Request"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddParama(sender: UIButton) {
    }

    @IBAction func RunRequest(sender: UIBarButtonItem) {
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell! = self.paramaTable.dequeueReusableCellWithIdentifier("ParamaCell")
         as UITableViewCell
        cell.textLabel.text = "1"
        cell.detailTextLabel.text = "2"
        return cell
    }
}
