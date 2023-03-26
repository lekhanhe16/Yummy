//
//  NetworkApi.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Alamofire
import Foundation
import SwiftyJSON

class NetworkApi {
    private init() {}

    static let shared = NetworkApi()
    
    private var sessionManager: Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return Session(configuration: config)
    }()
    
    func request(route: BaseRoute, completion: @escaping (JSON?, Error?) -> Void) {
        sessionManager.request(route)
            .response { response in
                switch response.result {
                    case .success(let data):
                        switch response.response?.statusCode ?? 0 {
                            case 200 ... 299:
                                guard let data = data else {
                                    print("Can't get data")
                                    return
                                }
                                let json = JSON(data)
                                completion(json , nil)
                            default:
                                return
                        }
                    
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
}
