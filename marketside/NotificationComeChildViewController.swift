//
//  NotificationComeChildViewController.swift
//  marketside
//
//  Created by 会津慎弥 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit
import CoreBluetooth

class NotificationComeChildViewController: UIViewController,CBCentralManagerDelegate {
    
    var myCentralManager: CBCentralManager!
    let request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCentralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
        print("state \(central.state)");
        
        switch (central.state) {
        case .PoweredOff:
            print("Bluetoothの電源がOff")
        case .PoweredOn:
            print("Bluetoothの電源はOn")
            
            // BLEデバイスの検出を開始.
            myCentralManager.scanForPeripheralsWithServices(nil, options: nil)
            
        case .Resetting:
            print("レスティング状態")
            
        case .Unauthorized:
            print("非認証状態")
            
        case .Unknown:
            print("不明")
            
        case .Unsupported:
            print("非対応")
        }
    }
    
    /*
     BLEデバイスが検出された際に呼び出される.
     */
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
        
        print("/////////")
        print("pheripheral.name: \(peripheral.name)")
        print("RSSI: \(RSSI)")
        print("peripheral.identifier.UUIDString: \(peripheral.identifier.UUIDString)")
        
        let rssi = RSSI as! Int
        
        var name: NSString? = advertisementData["kCBAdvDataLocalName"] as? NSString
        
        if (name == nil) {
            name = "no name";
        }else{
            if(rssi >= -70){
                request.getOrderList(name!)
            }
        }
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
