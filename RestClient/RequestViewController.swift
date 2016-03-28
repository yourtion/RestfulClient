//
//  RequestViewController.swift
//  RestClient
//
//  Created by YourtionGuo on 7/22/14.
//  Copyright (c) 2014 yourtion. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var paramTable: UITableView!
    @IBOutlet var editParam: UIButton!
    @IBOutlet var requestURL: UITextField!
    @IBOutlet var requestAction: UISegmentedControl!
    
    var params = Array<Array<String>>()
    var selectParam = []
    var editingIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Request"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EditParam(sender: UIButton) {
        if(paramTable.editing){
            paramTable.editing = false
            sender.setTitle("Edit", forState: UIControlState.Normal)
        }else{
            paramTable.editing = true
            sender.setTitle("Done", forState: UIControlState.Normal)
        }
    }

    @IBAction func RunRequest(sender: UIBarButtonItem) {
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return params.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = paramTable.dequeueReusableCellWithIdentifier("ParamCell") else {
            return UITableViewCell()
        }
        let param = params[indexPath.row]
        cell.textLabel!.text = param[0] as String
        cell.detailTextLabel!.text = param[1] as String
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            params.removeAtIndex(indexPath.row)
            paramTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var paramView:ParamViewController;
        if segue.identifier == "AddParamSegue" {
            paramView = segue.destinationViewController as! ParamViewController
        }
        if segue.identifier == "EditParamSegue" {
            paramView = segue.destinationViewController as! ParamViewController
            let indexPath = paramTable.indexPathForSelectedRow
            selectParam = params[indexPath!.row] as NSArray
            paramView.param = selectParam
            paramView.edit = true
            editingIndex = indexPath!.row
        }
        if segue.identifier == "ShowResultSegue" {
            let resultView: ResultViewController = segue.destinationViewController as! ResultViewController
            resultView.requestUrl = requestURL.text!
            resultView.requestParams = params
            resultView.requestMethod = requestMethod()
            resultView.startRequest()
        }
    }
    
    func requestMethod () -> String {
        var method = String()
        switch requestAction.selectedSegmentIndex {
        case 1:
            method = "GET"
        case 2:
            method = "POST"
        case 3:
            method = "PUT"
        case 4:
            method = "DELETE"
        default:
            break
        }
        return method
    }
}
