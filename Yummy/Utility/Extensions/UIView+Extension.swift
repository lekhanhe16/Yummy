//
//  UIView+Extension.swift
//  Yummy
//
//  Created by acupofstarbugs on 25/03/2023.
//

import Foundation
import UIKit.UIView

extension UIView {
    var top: CGFloat {
        self.frame.origin.y
    }

    var height: CGFloat {
        self.frame.height
    }

    var bottom: CGFloat {
        top + height
    }
}
