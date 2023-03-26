//
//  MainViewController.swift
//  Yummy
//
//  Created by acupofstarbugs on 22/03/2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var img: UIView!
    @IBOutlet var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollview.delegate = self
        scrollview.bounces = true
        scrollview.alwaysBounceVertical = true
    }
}

extension MainViewController: UIScrollViewDelegate {

}
