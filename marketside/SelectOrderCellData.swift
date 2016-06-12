//
//  SelectOrderCustomCell.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class SelectOrderCellData: NSObject {

    var item_name:String
    var item_count:String
    
    init(item_name:String,item_count:String){
        self.item_name = item_name
        self.item_count = item_count
    }
    
}
