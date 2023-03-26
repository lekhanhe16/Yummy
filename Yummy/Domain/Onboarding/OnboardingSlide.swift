//
//  Onboarding.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import Foundation
import UIKit.UIImage
struct OnboardingSlide {
    let title: String
    let description: String
    let image: UIImage
}


struct Response: Decodable {
    let status:Int
    let message:String
}
