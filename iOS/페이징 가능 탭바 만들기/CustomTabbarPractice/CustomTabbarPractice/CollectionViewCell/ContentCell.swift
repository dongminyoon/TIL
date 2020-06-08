//
//  ContentCell.swift
//  CustomTabbarPractice
//
//  Created by 윤동민 on 2020/05/01.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    static let identifier: String = "contentCell"
    
    private var indexLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private var indexPath: Int? {
        willSet {
            guard let pageIndex = newValue else { return }
            indexLabel.text = "Page\(pageIndex)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .gray
        self.addSubview(indexLabel)
        indexLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indexLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setIndex(_ index: Int) {
        indexPath = index
    }
}
