//
//  commonViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/9/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit




class commonViewController : ViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var commonTable: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : commonCell = commonTable.dequeueReusableCellWithIdentifier("commonCell")! as! commonCell
        
        //let currentIcon : milTableData = milCollection[indexPath.row]
        
        //cell.milIcon!.image = UIImage(named: currentIcon.icon)
    
        
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
/*
        let getMilDetails = segue.destinationViewController as! milDetailsViewController
        
        let indexPath : NSIndexPath? = milTable.indexPathForSelectedRow
        
        getMilDetails.selectedMIL = milCollection[indexPath!.row]
  */
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


