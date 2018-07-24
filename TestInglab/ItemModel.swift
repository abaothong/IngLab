//
//  ItemModel.swift
//  TestInglab
//
//  Created by Haoyi Thong on 24/07/2018.
//  Copyright © 2018 Thong. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper



class ItemModel: NSObject, Mappable  {
    var name: String = ""
    var isActive: Bool = false
    var phone: String = ""
    var picture: String = ""
    var index: Int = -1
    var balance: String = ""
    var email: String = ""
    
    override init() {}
    
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name        <- map["name"]
        isActive    <- map["isActive"]
        phone       <- map["phone"]
        picture     <- map["picture"]
        index       <- map["index"]
        email       <- map["email"]
        balance     <- map["balance"]
        
    }
    
    class func parse(data: NSArray) -> [ItemModel] {
        var modelArray: [ItemModel]? = []
        for item in data {
            let itemModel: ItemModel = ItemModel(JSONString: JSON(item).rawString()!)!
            modelArray?.append(itemModel)
        }
        return modelArray!
    }


}
