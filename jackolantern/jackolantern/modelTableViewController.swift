//
//  modelTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class modelTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //var
    var currentVehicle : [String] = ["", "", "", "", ""]
    var models : [String] = [String]()
    var yearID : [String] = [String]()
    
    //object
    var jsonObject : NSDictionary  = NSDictionary()
    
    //outlet for table
    @IBOutlet weak var modelTable: UITableView!
    
    //view did load
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
                                    //widdled down to model getting
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
        //load the table with data
        modelTable.reloadData()
    }
    
    //table setup
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return models.count
    }
    
    
    //table setup
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : modelTableViewCell = modelTable.dequeueReusableCellWithIdentifier("modelCell") as! modelTableViewCell
        
        cell.modelLabel.text = models[indexPath.row]
        
        return cell
    }
    
    //ye olde segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //index
        let indexPath : NSIndexPath? = modelTable.indexPathForSelectedRow
        
        //setup pass
        let mileageScreen = segue.destinationViewController as! mileageViewController
        
        //pass data
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
