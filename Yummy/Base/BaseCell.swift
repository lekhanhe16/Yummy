//
//  File.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Foundation

protocol BaseCell {
    func configCell<T>(item: T)
    static var reusableIdentifier: String {get}
}
