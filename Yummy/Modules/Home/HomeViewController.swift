//
//  HomeViewController.swift
//  Yummy
//
//  Created by acupofstarbugs on 18/03/2023.
//

import UIKit

enum Section {
    case CATEGORY
}
class HomeViewController: UIViewController {
    var viewModel = HomeViewModel()
    var dataSource: UICollectionViewDiffableDataSource<Int, CategoryEntity>!
    var snapShot = NSDiffableDataSourceSnapshot<Int, CategoryEntity>()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionview()
        viewModel.fetchCategories(completion: { [weak self] isSuccess, err in
            if isSuccess {
                self?.reloadData(section: .CATEGORY, items: self?.viewModel.categoryList)
            }
        })
    }
    
    func setupCollectionview() {
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.collectionViewLayout = createCollectionViewLayout()
        collectionView.register(CategoryCell.nib(), forCellWithReuseIdentifier: CategoryCell.reusableIdentifier)
        collectionView.delegate = self
        createDataSource()
    }
    
    func reloadData<T>(section: Section, items: T) {
        switch section {
            case .CATEGORY:
                if !snapShot.sectionIdentifiers.contains(0) {
                    snapShot.appendSections([0])
                }
                snapShot.appendItems((items as? [CategoryEntity]) ?? [], toSection: 0)
                dataSource.apply(snapShot)
        }
    }
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex,layoutEnv in
            switch sectionIndex {
                case 0:
                    return self?.createCategoriesSection()
                default:
                    return nil
            }
        }
        return layout
    }
    
    func dequeueReuseCell<T:BaseCell>(cls: T.Type, indexPath: IndexPath, item: Any) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T {
            cell.configCell(item: item)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] collectionView,indexPath,category in
            switch indexPath.section {
                case 0: // categories
                    return self?.dequeueReuseCell(cls: CategoryCell.self, indexPath: indexPath, item: category)
                default:
                    return UICollectionViewCell()
            }
        }
        
    }
    func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}
