//
//  CategoryEntity.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import Foundation

struct CategoryEntity: Hashable {
    var id: String
    var title: String
    var imgUrl: String
    init(from: Category) {
        self.id = from.id ?? ""
        self.title = from.title ?? ""
        self.imgUrl = from.imgUrl ?? ""
    }
}
