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
    var currentPage = 0 {
        didSet {
            print(currentPage)
            pageControl.currentPage = currentPage
            (currentPage == viewModel.getSlides().count - 1) ? btnNextSlide.setTitle("Get started", for: .normal) : btnNextSlide.setTitle("Next", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        pageControl.numberOfPages = viewModel.getSlides().count
    }

    @IBAction func btnNextClicked(_ sender: UIButton) {
        if currentPage == viewModel.getSlides().count - 1 {}
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
