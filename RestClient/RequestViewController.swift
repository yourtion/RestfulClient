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
    
    var param = Array<Array<String>>()
    var selectParam = []
    var editingIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Request"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EditParam(sender: UIButton) {
        if(self.paramTable.editing){
            self.paramTable.editing = false
            sender.setTitle("Edit", forState: UIControlState.Normal)
        }else{
            self.paramTable.editing = true
            sender.setTitle("Done", forState: UIControlState.Normal)
        }
    }

    @IBAction func RunRequest(sender: UIBarButtonItem) {
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.param.count;
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell! = self.paramTable.dequeueReusableCellWithIdentifier("ParamCell")
         as UITableViewCell
        let param = self.param[indexPath.row]
        cell.textLabel.text = param[0] as String
        cell.detailTextLabel.text = param[1] as String
        return cell
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            self.param.removeAtIndex(indexPath.row)
            self.paramTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue!.identifier == "AddParamSegue" {
            let paramView:ParamViewController = segue!.destinationViewController as ParamViewController
        }
        if segue!.identifier == "EditParamSegue" {
            let paramView:ParamViewController = segue!.destinationViewController as ParamViewController
            let indexPath = self.paramTable.indexPathForSelectedRow()
            selectParam = self.param[indexPath.row] as NSArray
            paramView.param = selectParam
            paramView.edit = true
            editingIndex = indexPath.row
        }
        if segue!.identifier == "ResultSegue" {
            let paramView: ResultViewController = ResultViewController()
            self.navigationController.pushViewController(paramView, animated: true)

        }
    }
}
