//
//  modelTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class modelTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var currentVehicle : [String] = ["", "", "", "", ""]
    var models : [String] = [String]()
    var yearID : [String] = [String]()
    
    var jsonObject : NSDictionary  = NSDictionary()
    
    
    @IBOutlet weak var modelTable: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        if let getMakes = jsonObject["makes"]{
            for theMakes in 0...(getMakes.count-1){
                if let makeName = getMakes[theMakes]["name"]{
                    if currentVehicle[1] == makeName as! String{
                        if let getModels = getMakes[theMakes]["models"]{
                            for modelNumber in 0...(getModels!.count-1){
                                if let getTheModels = getModels![modelNumber]["name"]{
                                    self.models.append(String(getTheModels!))
                                }
                                if let getID = getModels![modelNumber]["years"]!![0]["id"]{
                                    self.yearID.append(String(getID!))
                                }
                            }
                        }
                    }
                }
            }
        }
        
        modelTable.reloadData()
        
        
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return models.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : modelTableViewCell = modelTable.dequeueReusableCellWithIdentifier("modelCell") as! modelTableViewCell
        
        cell.modelLabel.text = models[indexPath.row]
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let indexPath : NSIndexPath? = modelTable.indexPathForSelectedRow
        
        let mileageScreen = segue.destinationViewController as! mileageViewController
        
        self.currentVehicle[2] = String(self.models[indexPath!.row])
        self.currentVehicle[3] = String(self.yearID[indexPath!.row])
        
        mileageScreen.currentVehicle = self.currentVehicle
        
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
