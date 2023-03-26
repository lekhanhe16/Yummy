//
//  OnboardingPageCollectionViewCell.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import UIKit

class OnboardingPageCollectionViewCell: UICollectionViewCell, BaseCell {
    static func nib() -> UINib {
        return UINib()
    }
    
    func configCell<T>(item: T) {
        let item = item as! OnboardingSlide
        imageView.image = item.image
        title.text = item.title
        Description.text = item.description
    }
    
    static var reusableIdentifier: String {
        return "OnboardingPageCollectionViewCell"
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Description: UILabel!
    
}

