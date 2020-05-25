//
//  CustomTabbar.swift
//  CustomTabbarPractice
//
//  Created by 윤동민 on 2020/05/01.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class CustomTabbar: UIView {
    static let nibName: String = "CustomTabbar"
    
    private var view: UIView!
    @IBOutlet weak var tabbarCollectionView: UICollectionView!
    @IBOutlet weak var indicatorView: UIView!
    
    var delegate: CustomTabbarDelegate?
        
//    private var indicatorLeadingConstraint: NSLayoutConstraint!
    private let itemSpacing: CGFloat = 10
    private var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
        setCollectionView()
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
        setCollectionView()
        setConstraint()
    }
    
    private func loadXib() {
        guard let view = Bundle.main.loadNibNamed(CustomTabbar.nibName, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        self.view = view
        self.addSubview(view)
    }
    
    private func setCollectionView() {
        tabbarCollectionView.delegate = self
        tabbarCollectionView.dataSource = self
        tabbarCollectionView.register(UINib(nibName: "LabelCell", bundle: nil), forCellWithReuseIdentifier: LabelCell.identifier)
        tabbarCollectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: [])
        tabbarCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setConstraint() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
//        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
//        indicatorLeadingConstraint.isActive = true
        indicatorView.leadingAnch
        indicatorView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        indicatorView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        
        indicatorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: self.view.bounds.width/4).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        indicatorView.backgroundColor = .green
    }
    
    func form(form: (UICollectionView, NSLayoutConstraint, IndexPath) -> Void) {
//        form(tabbarCollectionView, indicatorLeadingConstraint, selectedIndex)
    }
}

extension CustomTabbar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let labelCell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCell.identifier, for: indexPath) as? LabelCell else { return UICollectionViewCell() }
        labelCell.setIndex(indexPath.row)
        
        return labelCell
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard let attribute = tabbarCollectionView.layoutAttributesForItem(at: selectedIndex) else { return }
//        indicatorLeadingConstraint.constant = attribute.frame.origin.x - scrollView.contentOffset.x
//    }
}

extension CustomTabbar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
//        guard let attribute = tabbarCollectionView.layoutAttributesForItem(at: selectedIndex) else { return }
//
//        indicatorLeadingConstraint.constant = attribute.frame.origin.x - collectionView.contentOffset.x
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        delegate?.scrollTo(selectedIndex: selectedIndex)
    }
}

extension CustomTabbar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
