//
//  CategoryCell.swift
//  Yummy
//
//  Created by acupofstarbugs on 19/03/2023.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell, BaseCell{
    func configCell<T>(item: T) {
        //
        let category = item as! CategoryEntity
        title.text = category.title
        imgView.kf.setImage(with: URL(string: category.imgUrl))
    }
    
    static var reusableIdentifier: String {
        "CategoryCell"
    }
    
    static func nib() -> UINib {
        UINib(nibName: "CategoryCell", bundle: nil)
    }
    

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
