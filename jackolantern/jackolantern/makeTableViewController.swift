//
//  makeTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit
//import SwiftyJSON


class makeTableViewController: UIViewController, UINavigationControllerDelegate {
    
    //vars
    var currentVehicle : [String] = ["", "", "", "", ""]
    var makes : [String] = [String]()
    var models : [String] = [String]()
    
    var jsonObject : AnyObject?  = AnyObject?()
    
    @IBOutlet weak var makeTable: UITableView!
    
    //view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.delegate = self

        
    }
    
    //this is to remove the duplicating that occurs when going back and forth between various menu items
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool){
        if let yearController = viewController as? yearTableViewController {
            yearController.makes.removeAll()
            
        }
    }
    
    //table stuff
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //go ahead and perform segue
        dispatch_async(dispatch_get_main_queue(),{
        self.performSegueWithIdentifier("makeToModelSegue", sender: indexPath)
        })

    
    }



    //makeToModelSegue
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "makeToModelSegue" {
            return true
        }
        return false
    }
    
    
    //table setup
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //makes count
        return makes.count
    }
    
    //table setup
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : makeTableViewCell = makeTable.dequeueReusableCellWithIdentifier("makeCell")! as! makeTableViewCell
        
        //cell
        cell.makeLabel.text = makes[indexPath.row]
        
        //cell.yearLabel.text = currentYear
        return cell
    }
    
    //segue stuff
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath? = makeTable.indexPathForSelectedRow
        
        //makes[?]
        let modelSelect = segue.destinationViewController as! modelTableViewController
        
        //stuff to send
        modelSelect.models = self.models
        modelSelect.jsonObject = self.jsonObject
        modelSelect.currentVehicle[0] = String(self.currentVehicle[0])
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
