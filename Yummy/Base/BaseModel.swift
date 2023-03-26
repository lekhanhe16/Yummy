//
//  BaseModel.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import Foundation
import SwiftyJSON

class BaseModel{
    
    convenience required init?(obj: JSON) {
        self.init()
        self.mapping(json: obj)
    }
    
    convenience required init?(str: String) {
        self.init()
        self.mapping(json: JSON(parseJSON: str))
    }
    
    func mapping(json: JSON) {
        
    }
}

extension Array where Element: BaseModel {
    init(fromJSON json: JSON) {
        self.init()
        if json.type == .null { return }
        for item in json.arrayValue {
            if let object = Element.init(obj: item) {
                self.append(object)
            }
        }
    }

    init(fromString string: String) {
        self.init()
        let json = JSON(parseJSON: string)
        if json.type == .null { return }
        for item in json.arrayValue {
            if let object = Element.init(obj: item) {
                self.append(object)
            }
        }
    }
}
