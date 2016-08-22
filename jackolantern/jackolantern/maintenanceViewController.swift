//
//  maintenanceViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/11/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//





import UIKit
import CoreLocation
import MapKit

class maintenanceViewController  : UIViewController, CLLocationManagerDelegate {
    
    //var someObject : [maintenanceObject] = [maintenanceObject]()
    var listOfMaintenance : [[String]] = [[String]]()
    var shops : [[String]] = [[String]]()
    
    //local getter
    let locationManager = CLLocationManager()
    
    //more variables
    var itemCount : Int = Int()
    var shopCount : Int = Int()
    
    var currentVehicle : [String] = ["", "", "", "", ""]
    
    //outlets
    @IBOutlet weak var selectedVehicleLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var maintenanceTable: UITableView!
    @IBOutlet weak var shopTable: UITableView!
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //locations
        self.locationManager.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
        
        //get stuff
        self.selectedVehicleLabel.text = "\(self.currentVehicle[0]) \(self.currentVehicle[1]) \(self.currentVehicle[2]))"
        self.mileageLabel.text = "\(self.currentVehicle[4]) miles"

        //url
        let requestURL = NSURL(string: "https://api.edmunds.com/v1/api/maintenance/actionrepository/findbymodelyearid?modelyearid=\(currentVehicle[3])&fmt=json&api_key=a69s88jdn9qtfdyufxr9mch9")!
        
        //get rid of headers and footers
        maintenanceTable.tableFooterView = nil
        maintenanceTable.tableHeaderView = nil
        shopTable.tableFooterView = nil
        self.shopTable.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        self.maintenanceTable.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        shopTable.tableHeaderView = nil
        
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
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    if let theObject = (jsonObject["actionHolder"]){
                        if theObject!.count != nil {
                            self.itemCount = theObject!.count
                            if theObject!.count > 0 {
                                
                                for q in 0...(self.itemCount-1){
                                    let thisItem : [String] = [theObject![q]["item"] as! String, theObject![q]["action"] as! String, String(theObject![q]["intervalMileage"] as! Int), theObject![q]["itemDescription"] as! String]
                                    self.listOfMaintenance.append(thisItem)
                                    
                                }
                                
                                
                            }
                        }
                    }
                    
                    //do it
                    dispatch_async(dispatch_get_main_queue(),{
                        self.maintenanceTable.reloadData()
                    })
                }catch let error {
                    //print error if it occurs
                    print("Error: \(error)")
                }
            }
            
        }
        //go
        task.resume()
        
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //variables
        let userLocation:CLLocation = locations[0]
        let long: Double?  = userLocation.coordinate.longitude;
        let lat: Double? = userLocation.coordinate.latitude;
        
        
        //get everything sorted
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Auto Repair"
        //ensure you have coordinates
        if let yourLong = long{
            if let yourLat = lat{
                let locationalized : CLLocationCoordinate2D = CLLocationCoordinate2DMake(yourLat, yourLong)
                request.region = MKCoordinateRegionMakeWithDistance(locationalized, 1500, 1500)
                //mklocal search request to get data from apple maps
                MKLocalSearch(request: request).startWithCompletionHandler { (response, error) in
                    guard error == nil else { return }
                    guard let response = response else { return }
                    guard response.mapItems.count > 0 else { return }
                    //count through results
                    for whichThing in 0...(response.mapItems.count-1){
                        let name = response.mapItems[whichThing].name
                        let phoneNumber = response.mapItems[whichThing].phoneNumber
                        let theResult : [String] = [name!, phoneNumber!]
                        self.shops.append(theResult)
                    }
                    
                    //build table
                    dispatch_async(dispatch_get_main_queue(),{
                        self.shopTable.reloadData()
                    })
                }
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location Failed: \(error.localizedDescription)")
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if (tableView == self.maintenanceTable){
            //maintenancetable
            return itemCount
            
        }else{
            //shoptable
            return shops.count
            
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if (tableView == self.maintenanceTable){
            //maintenancetable
            
            //build cells
            let cell : maintenanceTableViewCell = maintenanceTable.dequeueReusableCellWithIdentifier("maintenanceCell") as! maintenanceTableViewCell
            //get data
            if self.listOfMaintenance[indexPath.row][2] != "0"{
                cell.intervalLabel.text = "Every \(self.listOfMaintenance[indexPath.row][2]) miles"
            }else{
                cell.intervalLabel.text = "Every service visit"
            }
            cell.itemActionLabel.text = "\(self.listOfMaintenance[indexPath.row][1]) : \(self.listOfMaintenance[indexPath.row][0])"
            
            //return it
            return cell
            
        }else if (tableView == self.shopTable){
            //shoptable
            
            //build cells
            let cell : shopTableViewCell = shopTable.dequeueReusableCellWithIdentifier("shopTableCell") as! shopTableViewCell
            //get data
            cell.shopName.text = self.shops[indexPath.row][0]
            cell.shopNumber.text = self.shops[indexPath.row][1]
            //return cells
            return cell
            
        }else{
            //bs response in case of thermonuclear war
            let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("default")!
            return cell
        }
    }
    
    //seguenator
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue == "maintToMaintDetails"){
            //maintenancetable
            
            
            let indexPath : NSIndexPath? = maintenanceTable.indexPathForSelectedRow
            
            let maintScreen = segue.destinationViewController as! maintenanceDetails
            print(listOfMaintenance[(indexPath?.row)!])
            maintScreen.listOfMaintenance = self.listOfMaintenance[(indexPath?.row)!]
            
        }else{
            //shoptable
        }
    }
    
    //warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
