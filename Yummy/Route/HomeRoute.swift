//
//  omeRoute.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Alamofire
import Foundation

enum HomeEndpoint {
    case categories
}

class HomeRoute: BaseRoute {
    private var endpoint: HomeEndpoint
    init(endpoint: HomeEndpoint) {
        self.endpoint = endpoint
    }
    
    override var path: String {
        switch endpoint {
            case .categories:
                return "/dish-categories"
        }
    }
    
    override var params: Parameters? {
        nil
    }
    
    override var method: HTTPMethod {
        switch endpoint {
            case .categories:
                return .get
        }
    }
    
    override var headers: HTTPHeaders? {
        nil
    }
    
    override var paramEncoding: ParameterEncoding {
        if method == .get {
            return URLEncoding.default
        }
        return JSONEncoding.default
    }
}
