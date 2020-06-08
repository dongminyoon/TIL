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
        
    private let itemSpacing: CGFloat = 10
    private var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    private var customConstraints: [NSLayoutConstraint] = []
    
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
        customConstraints = [indicatorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)]
        NSLayoutConstraint.activate(customConstraints)
        
        indicatorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: self.view.bounds.width/4).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        indicatorView.backgroundColor = .green
    }
    
    func scrollScene(to page: Int) {
        selectedIndex = IndexPath(row: page, section: 0)
        tabbarCollectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: .centeredHorizontally)
        collectionView(tabbarCollectionView, didSelectItemAt: selectedIndex)
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
}

extension CustomTabbar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        guard let cell = collectionView.cellForItem(at: selectedIndex) else { return }
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: true)
        NSLayoutConstraint.deactivate(customConstraints)
        customConstraints = [
            indicatorView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
        ]
        NSLayoutConstraint.activate(customConstraints)
        
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
