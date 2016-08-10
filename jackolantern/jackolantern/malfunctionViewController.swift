//
//  malfunctionViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/8/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit




class malfunctionViewController : ViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var milTable: UITableView!
    
    
    var milCollection : [milTableData] = []
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //data source for table:
        
        
        let mil1 : milTableData = milTableData(title: "Antilock Braking System Light", icon: "ABS.png", details: "The ABS light is indicating that the Antilock Braking System has set a malfunction code, meaning that it has detected a problem. Your ABS system helps provide traction when braking on slick surfaces such as gravel, rain, snow or ice. If the light is illuminated, the system has failed and will be disabled. The vehicle will require diagnostics using a high-level computerized scanning tool used in locally owned repair shops to large automotive dealerships. ", image: "brakes.jpg")
        milCollection.append(mil1)
        
        let mil2 : milTableData = milTableData(title: "Battery or Charging Light", icon: "battery.png", details: "The battery light indicates a problem with the battery or charging system. It is recommended to have the battery, charging and starting system tested. ", image: "engineBay.jpg")
        milCollection.append(mil2)
        
        let mil3 : milTableData = milTableData(title: "Brake System Light", icon: "brakesystem.png", details: "The parking brake is set, the brake fluid is low, a problem with the braking system, or a problem with the antilock braking system. Check the emergency or parking brake and ensure they are both in the released position. Ensure the fluid is full. If the light remains on, you may require professional assistance.", image: "brakes.jpg")
        milCollection.append(mil3)
        
        let mil4 : milTableData = milTableData(title: "Check Engine Light", icon: "checkEngineLight.png", details: "The Check Engine Light indicates that the engine management system has set a fault code. Many parts stores and shops will read these codes for free. These codes can tell you what sensor is reading a failure. This information provides clues to eliminate malfunctions. ", image: "engineBay.jpg")
        milCollection.append(mil4)
        
        let mil5 : milTableData = milTableData(title: "Coolant Temperature Light", icon: "coolantTemp.png", details: "The coolant temperature warning light indicates the temperature has exceeded normal limits, check coolant levels, look for water or steam escaping, check that the fan is operating. Do not drive or run a vehicle that is overheated. Do not open the cooling system cap while the vehicle is hot. The coolant can burn you severely. Cooling system repairs should not be ignored, as they can cause catastrophic engine failure at any time.", image: "mil.jpg")
        milCollection.append(mil5)
        
        let mil6 : milTableData = milTableData(title: "Cruise Control Indicator", icon: "cruisecontrol.png", details: "The cruise control indicator shows that the cruise control has been activated. ", image: "mil.jpg")
        milCollection.append(mil6)
        
        let mil7 : milTableData = milTableData(title: "Door Ajar Indicator", icon: "doorajar.png", details: "The Door Ajar Light is indicating that a door is open, or the door latch is not signaling that it is closed.", image: "mil.jpg")
        milCollection.append(mil7)
        
        let mil8 : milTableData = milTableData(title: "Electronic Stability Protection Fault Indicator", icon: "espfault.png", details: "The ESP or Electronic Stability Protection light indicates a problem with the traction control system, generally involving sensor failure or communication problems. This is a more advanced problem that requires special scanning tools and experience to repair. It is recommended that you visit a shop to have it properly diagnosed and repaired.", image: "brakes.jpg")
        milCollection.append(mil8)
        
        let mil9 : milTableData = milTableData(title: "Fog-Lamp Indicator", icon: "foglamps.png", details: "This light indicates that the fog lamps are active. The bright lights use a similar indicator, usually green, where as the fog lamp indicator is usually white. Daytime running lamps also use a similar indicator, which is usually blue.", image: "mil.jpg")
        milCollection.append(mil9)
        
        let mil10 : milTableData = milTableData(title: "Gas-Cap Light", icon: "gascap.png", details: "This light indicates an Evaporative Emissions System (EVAP) failure. Your vehicle seals the fuel tank to capture evaporated fuel. Once and a while, it will then purge the collected condensate into the engine to remove it. This light indicates a problem within that system. Generally, the most common error is a poorly sealed Gas Cap. After checking the gas cap, several drive cycles must occur before the light will clear. You may have to drive it for a few days to clear the light. If it doesn't go out after several drive cycles, the Check Engine Light will be activated. While this problem usually has little effect on the performance of the vehicle, it can cause problems if left unchecked. In emissions controlled states, your vehicle's Evaporative Emissions System must be functional. A leak can allow contaminates into the fuel and gasoline will literally evaporate out of the tank. Bad for the environment, yet also impacting your wallet, the evap system can let more sinister substances find their way into your engine, resulting in damage or larger problems.", image: "mil.jpg")
        milCollection.append(mil10)
        
        let mil11 : milTableData = milTableData(title: "Lamp Out Indicator", icon: "lampout.png", details: "The lamp-out indicator lets the driver know that a bulb needs serviced, which could require a new one or may indicate a deeper problem. Some manufacturers have designed the vehicle to store a code detailing which light is out, while others simply indicate a broken connection somewhere in the system. Have a friend work the lights while you walk around your vehicle. Try combinations of lights like headlamps, brake lights and turn signals. Turn them on together, seperate, and all at once. Doublecheck running lights and marker lights by looking at both sides multiple times. What looks like a reflector could harbor a bad bulb. Check your license plate bulbs. Don't forget foglamps, daytime running lamps and reverse lights. Some bulbs are easier to change than others. Handling the glass of a bulb shortens it's lifespan considerably. If you do touch it, polish your finger's oil off of the surface prior to turning the lights on. A greasy fingerprint can cause a bulb to fail in minutes. Most autoparts stores will change bulbs for free, if you purchase the bulb there. Even many dealerships will, although this is generally used to get you in the door to sell more repairs.", image: "headlights.jpg")
        milCollection.append(mil11)
        
        let mil12 : milTableData = milTableData(title: "Oil Change Required Indicator", icon: "oilchange.png", details: "Sometimes a message on a display, this light indicates it is time for an oil change. The light must be reset when the repairs are performed. While you can reset the light, it is there for your convenience.", image: "openHood.jpg")
        milCollection.append(mil12)
        
        let mil13 : milTableData = milTableData(title: "Oil Pressure Light", icon: "oilpressure.png", details: "The oil pressure light is illuminated when oil pressure falls too low or exceeds the recommended specifications. Low oil pressure can indicate a low oil level or internal engine problem. High oil pressure can be dangerous as well. A light may also indicate a failed oil pressure sensor or wiring problem as well. It is recommended that you have the oil pressure tested and determine if there really is a pressure problem, or just a bad sensor. An oil pressure problem can damage the engine, and should be avoided if at all possible.", image: "openHood.jpg")
        milCollection.append(mil13)
        
        let mil14 : milTableData = milTableData(title: "Overdrive Indicator", icon: "overdrivelight.png", details: "The Over-Drive indicator is illuminated when Over-Drive has been disabled. Many vehicles have a switch to disable it. Over-Drive is an extra transmission gear that activates at highway speed to improve fuel-economy and reduce emissions considerably. The light comes on when Over-Drive is disabled, and goes out when it is re-enabled.", image: "bigTruck.jpg")
        milCollection.append(mil14)
        
        let mil15 : milTableData = milTableData(title: "Reduced Power Indicator", icon: "reducedpower.png", details: "This light indicates that the vehicle has restricted the engine to lower the risk of damage while still allowing the driver o limp into a shop. This light should be taken serious. The light can also indicate that the vehicle's computers cannot determine if damage is occurring due to failed sensors. In this case, the engine is not in danger neccesarily, but the computer can not verify that so it will err on the safe side and set the indicator and reduce the engine power. Sometimes a glitch could cause it, and shutting the car off and restarting it may help, but generally this is not the case. See your local repair facility as soon as possible to ensure minimal damge to your vehicle. ", image: "transmission.jpg")
        milCollection.append(mil15)
        
        let mil16 : milTableData = milTableData(title: "Security Alert Light", icon: "securityalert.png", details: "Security systems involve different means of authentication, but most require a chipped key be programmed to the vehicle. When you start the vehicle, the chip is read by a sensor, which tells the computers to either allow the vehicle to run, or disable it. A failure of the key, the ignition switch, or a variety of modules can cause this light to set. Unfortunately this is generally a light best left to dealerships. Very few repair shops can handle vehicle key programming.", image: "keyfob.jpg")
        milCollection.append(mil16)
        
        let mil17 : milTableData = milTableData(title: "Service Vehicle Soon Indicator", icon: "servicevehiclesoon.png", details: "This light usually indicates that the Body Control Module has detected a failure. The vehicle may have a bad light bulb, or could have communication problems between other modules. Check your vehicle lights and ensure they all are working.", image: "openHood.jpg")
        milCollection.append(mil17)
        
        let mil18 : milTableData = milTableData(title: "Tire Pressure Monitoring System Indicator", icon: "TPMS.png", details: "A tire light comes on when the tire pressure falls below (or above in some cases) a set tire pressure specification. Check the driver-side door jam for pressure specifications. Temperature variations in the Fall or Winter can cause tire pressure to drop, which will set the light. Tire leaks, bad valve stems or poorly sealed mounting can cause tires to leak. A tire shop can quickly adjust these things. Some dealers or service facilities will adjust tire pressure at no charge for loyal customers.", image: "tires.jpg")
        milCollection.append(mil18)
        
        let mil19 : milTableData = milTableData(title: "Traction Control Light", icon: "tractioncontrol.png", details: "The traction control system uses a variety of techniques to maintain control of the vehicle on loose gravel, rain, snow or ice. This light will come on or flicker when the traction control is active or in use. The light is also illuminated when the traction control is disabled via switch or in some cases as an error light.", image: "brakes.jpg")
        milCollection.append(mil19)
        
        let mil20 : milTableData = milTableData(title: "Transmission Temperature Light", icon: "transmissiontemperature.png", details: "This light indicates the transmission temperature has exceeded safe operating temperatures, often while towing or in mountainous terrain. Continuing to operate the vehicle may result in reduced power modes activating, or damage to the vehicle. The vehicle should be given adequate time to cool.", image: "transmission.jpg")
        milCollection.append(mil20)
        
        let mil21 : milTableData = milTableData(title: "Washer Fluid Level Indicator", icon: "washerfluid.png", details: "This light indiacates a low washer fluid level, or a bad sensor. Some types of washer fluid may coat the sensor causing it to read low when in reality it is not.", image: "openHood.jpg")
        milCollection.append(mil21)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return milCollection.count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : milCell = milTable.dequeueReusableCellWithIdentifier("milCell")! as! milCell
        
        let currentIcon : milTableData = milCollection[indexPath.row] 
        
        cell.milIcon!.image = UIImage(named: currentIcon.icon)
        
        return cell
    }
    
    
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
    }
    */
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

