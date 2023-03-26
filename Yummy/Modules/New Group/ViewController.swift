//
//  ViewController.swift
//  Yummy
//
//  Created by acupofstarbugs on 22/03/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cartBtn: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstView: UIImageView!
//    @IBOutlet var gview: UIView!
    var oriFrame: CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        hideKeyboardWhenTappedAround()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func btnCartClicked(_ sender: UIBarButtonItem) {
        print("hello")
    }
    
    func setConstraintPriority(top: Float, bot: Float) {
        if top == topConstraint.priority.rawValue {
            return
        }
        topConstraint.priority = UILayoutPriority(top)
        bottomConstraint.priority = UILayoutPriority(bot)
    }
    func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard() {
            searchBar.endEditing(true)
        }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if firstView.alpha >= 0.0, firstView.alpha <= 1.0, scrollView.contentOffset.y > 0 {
            firstView.alpha = 1 - abs(scrollView.contentOffset.y / firstView.height)
            setConstraintPriority(top: 1000, bot: 500)
        }
        else {
            setConstraintPriority(top: 500, bot: 1000)
        }
        if firstView.alpha < 0 {
            firstView.alpha = 0
        }
        if firstView.alpha > 1 {
            firstView.alpha = 1
        }
    }
}

extension ViewController: UISearchBarDelegate {
//    search
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("h")
        searchBar.resignFirstResponder()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hello")
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
