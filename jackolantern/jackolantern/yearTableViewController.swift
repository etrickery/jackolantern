//
//  yearTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class yearTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    //var parsable : [String : [String : [String : [String : Int]]]]
    
    //var range, makes/models/data storage and data to pass
    var yearRange : [Int] = [2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990]
    var makes : [String] = [String]()
    var models : [String] = [String]()

    
    
    //status
    var goAhead : Bool = false
    
    //year table
    @IBOutlet weak var yearTableOutlet: UITableView!
    
    //an empty object
    var jsonObject : AnyObject?  = AnyObject?()
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.delegate = self
        
    }
    
    //table setup
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return yearRange.count
    }
    
    
    //table setup
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : yearTableViewCell = yearTableOutlet.dequeueReusableCellWithIdentifier("yearCell")! as! yearTableViewCell
        
        //fill table
        let currentYear : String = String(yearRange[indexPath.row])
        
        //setup label
        cell.yearLabel.text = currentYear
        
        //return cell
        return cell
    }
    
    //table setup
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let requestURL = NSURL(string: "https://api.edmunds.com/api/vehicle/v2/makes?state=used&year=\(yearRange[indexPath.row])&view=basic&fmt=json&api_key=a69s88jdn9qtfdyufxr9mch9")!
        
        //setup request
        let urlRequest = NSMutableURLRequest(URL: requestURL)
        //create session
        let session = NSURLSession.sharedSession()
        //build task
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) in
            //variable to contain response
            let httpResponse = response as! NSHTTPURLResponse
            //store status code
            let statusCode = httpResponse.statusCode
            //check for success, else - error codes
            if (statusCode == 200) {
                do{
                    //get json object and pass it on as currentjsonobject [String : AnyObject]
                    self.jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    //get stuff
                    

                    //work the json object
                    if let theObject = (self.jsonObject!["makes"]){
                        let makeCount = theObject!.count
                        for q in 0...(makeCount-1){
                            if let makeOptions = theObject![q]["name"]{
                                self.makes.append(makeOptions! as! String)
                                
                            }
                            
                        }
                    }
                    //status update
                    self.goAhead = true
                    //go make segue happen
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        self.performSegueWithIdentifier("yearToMakeSegue", sender: indexPath)
                    })
                    
                }catch let error {
                    //print error if it occurs
                    print("Error: \(error)")
                }
            }
            
        }
        //do it
        task.resume()
        
    }
    
    //when to perform segue
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "yearToMakeSegue" {
            return goAhead
        }
        return false
    }
    
    //ye old segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath? = yearTableOutlet.indexPathForSelectedRow
        
        
        //makes[?]
        let makeSelect = segue.destinationViewController as! makeTableViewController
        
        //do the stuff
        makeSelect.makes = self.makes
        makeSelect.jsonObject = self.jsonObject
        makeSelect.currentVehicle[0] = String(self.yearRange[indexPath!.row])
        makeSelect.models = self.models
    

    
    
    }
    
    //ye error
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
