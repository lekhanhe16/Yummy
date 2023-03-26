//
//  Category.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import Foundation
import SwiftyJSON

class Category: BaseModel {
    var id: String?
    var title: String?
    var imgUrl: String?
    
    override func mapping(json: JSON) {
        self.id = json["id"].string
        self.title = json["title"].string
        self.imgUrl = json["image"].string
    }
}
