//
//  BaseRoute.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Foundation
import Alamofire

class BaseRoute: URLConvertible {
    func asURL() throws -> URL {
        URL(string: baseUrl+path)!
    }
    
    private var baseUrl: String {
        "https://yummie.glitch.me"
    }
    
    var path: String {
        fatalError("path is not overrided yet")
    }
    
    var params: Parameters? {
        fatalError("params is not overrided yet")
    }
    
    var method: HTTPMethod {
        fatalError("method is not overrided yet")
    }
    
    var headers: HTTPHeaders? {
        fatalError("method is not overrided yet")
    }
    
    var paramEncoding: ParameterEncoding {
        fatalError("method is not overrided yet")
    }
}
