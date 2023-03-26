//
//  File.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Foundation
import UIKit.UINib

protocol BaseCell : UICollectionViewCell{
    func configCell<T>(item: T)
    static var reusableIdentifier: String {get}
    static func nib() -> UINib
}
