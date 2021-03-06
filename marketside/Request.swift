//
//  Request.swift
//  marketside
//
//  Created by 会津慎弥 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit
import Alamofire

class Request: NSObject {
    
    let baseURL = "https://funhacks.herokuapp.com/"
    let baseUUID = "1C9E7387-58E7-4B11-B9B1-83A279A921D6"
    let baseName = "八百屋さん"
    
    /*let baseUUID = "12F5664F-4488-4D64-A1B6-1CA630AF5FF6"
    let baseName = "お肉屋さん"*/
    
    func marketRegister(){
        
        let params = [
            "uuid": baseUUID,
            "name": baseName
        ]
        
        Alamofire.request(.POST, baseURL + "shop/regist", parameters: params)
            .responseJSON { response in
                print(response)
                
            }
    }
    
    func getOrderList(uuid: NSString, callBackClosure:(items_count: NSMutableArray, items_name: NSMutableArray)->Void){
        
        Alamofire.request(.GET,baseURL+"shop/"+baseUUID + "/" + (uuid as String))
            .validate()
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                
                var items_count: NSMutableArray = NSMutableArray()
                var items_name: NSMutableArray = NSMutableArray()
                
                json["data"].forEach{ (_, json) in
                    items_count.addObject(json["count"].stringValue)
                    items_name.addObject(json["name"].stringValue)
                }
                
                print(items_count)
                
                callBackClosure(items_count: items_count, items_name: items_name)
    }
}
}
