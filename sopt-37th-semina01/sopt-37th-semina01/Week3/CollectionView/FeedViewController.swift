//
//  FeedViewController.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/1/25.
//

import UIKit

import SnapKit
import Then

final class FeedViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 21
    private let cellHeight: CGFloat = 198
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    private var feeds: [FeedModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
        setData()
    }
    
    private func setUI() {
        view.addSubviews(collectionView)
        view.backgroundColor = .white
        title = "피드"
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setData() {
        feeds = FeedModel.mockData
        collectionView.reloadData()
    }
    
    //    private func setCollectionViewLayout() {
    //        let flowLayout = UICollectionViewFlowLayout()
    //        let screenWidth: CGFloat = self.view.window?.windowScene?.screen.bounds.width ?? 0
    //        // let screenWidth: CGFloat = UIScreen.main.bounds.width
    //
    //        let doubleCellWidth = screenWidth - collectViewInset.left - collectViewInset.right - itemSpacing
    //
    //        flowLayout.itemSize = CGSize(width: doubleCellWidth / 2, height: cellHeight)
    //        flowLayout.minimumLineSpacing = lineSpacing
    //        flowLayout.minimumInteritemSpacing = itemSpacing
    //        flowLayout.sectionInset = collectViewInset
    //
    //        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    //    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInset: CGFloat = 20
        let width = (collectionView.frame.width - (itemSpacing + horizontalInset * 2)) / 2
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectViewInset
    }
}


extension FeedViewController: UICollectionViewDelegate {
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(feed: feeds[indexPath.item])
        cell.delegate = self
        return cell
    }
}


extension FeedViewController: FeedCollectionViewCellDelegate {
    func didTapScrapButton(_ cell: FeedCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        feeds[indexPath.item].isScrap.toggle() // feed의 값을 변경 시키고
        cell.scrapButton.isSelected.toggle() // cell에 접근해서 해당 scrapbutton을 토글
    }
    
    
}
