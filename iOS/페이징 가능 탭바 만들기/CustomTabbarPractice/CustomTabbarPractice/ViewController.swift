//
//  ViewController.swift
//  CustomTabbarPractice
//
//  Created by 윤동민 on 2020/04/30.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

protocol CustomTabbarDelegate {
    func scrollTo(selectedIndex: IndexPath)
}

class ViewController: UIViewController {
    @IBOutlet weak var customTabbarViews: CustomTabbar!
    @IBOutlet weak var contentCollectionView: UICollectionView! {
        didSet {
//            if let layout = contentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                layout.itemSize = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionView()
        customTabbarViews.delegate = self
    }
    
    private func setCollectionView() {
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else { return UICollectionViewCell() }
        contentCell.setIndex(indexPath.row)
        return contentCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / scrollView.frame.width)
        customTabbarViews.scrollScene(to: page)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: CustomTabbarDelegate {
    func scrollTo(selectedIndex: IndexPath) {
        contentCollectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: true)
    }
}
