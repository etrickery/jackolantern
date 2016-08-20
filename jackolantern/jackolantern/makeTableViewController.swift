//
//  makeTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit
//import SwiftyJSON


class makeTableViewController: UIViewController {
    
    
    var currentVehicle : [String] = ["", "", "", "", ""]
    var makes : [String] = [String]()
    var models : [String] = [String]()
    
    var jsonObject : [String : AnyObject]  = [String : AnyObject]()
    
    @IBOutlet weak var makeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        
        return makes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : makeTableViewCell = makeTable.dequeueReusableCellWithIdentifier("makeCell")! as! makeTableViewCell
        
        
        
        cell.makeLabel.text = makes[indexPath.row]
        
        
        
        
        
        //cell.yearLabel.text = currentYear
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath? = makeTable.indexPathForSelectedRow
        
        //makes[?]
        let modelSelect = segue.destinationViewController as! modelTableViewController
        
        
        
        
        
        
        modelSelect.models = self.models
        modelSelect.jsonObject = self.jsonObject
        modelSelect.currentVehicle[1] = String(self.makes[indexPath!.row])
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
