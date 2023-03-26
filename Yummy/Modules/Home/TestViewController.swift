//
//  TestViewController.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import UIKit

class TestViewController: UIViewController {
    var originHeight = 0
    var shouldDismiss: Bool? = nil
    var appearCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        print("clikedasd")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        originHeight = originHeight == 0 ? Int(view.frame.size.height) : originHeight
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Int(view.frame.size.height) == originHeight && appearCount > 0{

            DispatchQueue.main.async {
                let rect = CGRect(x: 0, y: Int(self.view.frame.size.height)/3, width: Int(self.view.frame.size.width), height: Int(self.view.frame.size.height)*2/3)
                self.view.frame = rect
                self.view.layer.cornerRadius = 20
            }
        }
    }
}

extension TestViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        appearCount += 1
    }
}
