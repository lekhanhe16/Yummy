//
//  CategoryList.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import Foundation
import SwiftyJSON

class CategoryList : BaseModel {
    var list = [Category]()
    
    override func mapping(json: JSON) {
        self.list = [Category](fromJSON: json["categories"])
    }
}
