//
//  HomeViewModel.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import Foundation

class HomeViewModel {
//    private var categories
    var categoryList = [CategoryEntity]()
    func fetchCategories(completion: @escaping (Bool, Error?) -> Void) {
        NetworkApi.shared.request(route: HomeRoute(endpoint: .categories)) { [weak self] jsonData, err in
            if let json = jsonData, err == nil {
                if let result = CategoryList(obj: json["data"]) {
                    for e in result.list {
                        self?.categoryList.append(CategoryEntity(from: e))
                    }
                    completion(true, nil)
                }
            }
            else {
                completion(false, err)
            }
        }
    }
}
