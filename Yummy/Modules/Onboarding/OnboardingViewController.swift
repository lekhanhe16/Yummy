//
//  ViewController.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var btnNextSlide: UIButton!
    let viewModel = OnboardingViewModel()
    var isOnboard = false
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            (currentPage == viewModel.getSlides().count - 1) ? btnNextSlide.setTitle("Get started", for: .normal) : btnNextSlide.setTitle("Next", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isOnboard = viewModel.isOnboardingFinished()
        if !isOnboard {
            collectionView.dataSource = self
            collectionView.delegate = self
            pageControl.numberOfPages = viewModel.getSlides().count
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isOnboard {
            print("Here")
//            let storyBoard = UIStoryboard(name: "Home", bundle: nil)
//            let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC")
            ////            homeVC.modalPresentationStyle = .fullScreen
//            let navController = UINavigationController(rootViewController: homeVC)
//            navController.modalPresentationStyle = .fullScreen
//            present(navController, animated: true)

            let storyBoard = UIStoryboard(name: "Test", bundle: nil)
            let homeVC = storyBoard.instantiateViewController(withIdentifier: "ViewController")
//            homeVC.modalPresentationStyle = .fullScreen
            let navController = UINavigationController(rootViewController: homeVC)
            navController.modalPresentationStyle = .fullScreen
//            homeVC.modalPresentationStyle = .fullScreen
            present(navController, animated: true)
        }
    }

    @IBAction func btnNextClicked(_ sender: UIButton) {
        if currentPage == viewModel.getSlides().count - 1 {
            UserDefaults.standard.set(true, forKey: Constant.IS_ONBOARDING)
            let storyBoard = UIStoryboard(name: "Home", bundle: nil)
            let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC")
            homeVC.modalPresentationStyle = .fullScreen
            homeVC.modalTransitionStyle = .flipHorizontal
            present(homeVC, animated: true)
        }
        else {
            collectionView.isPagingEnabled = false
            currentPage += 1
            collectionView.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getSlides().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingPageCollectionViewCell.reusableIdentifier, for: indexPath) as? OnboardingPageCollectionViewCell {
            cell.configCell(item: viewModel.getSlides()[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let curPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        currentPage = curPage
    }
}
