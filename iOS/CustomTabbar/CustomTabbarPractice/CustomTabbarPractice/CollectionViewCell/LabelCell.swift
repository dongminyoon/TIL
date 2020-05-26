//
//  LabelCell.swift
//  CustomTabbarPractice
//
//  Created by 윤동민 on 2020/04/30.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    static let identifier: String = "LabelCell"
    
    var pageLabel: UILabel = {
        let customLabel = UILabel()
        customLabel.textColor = UIColor.lightGray
        customLabel.font = UIFont.boldSystemFont(ofSize: 20)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        return customLabel
    }()
    
    private var indexPath: Int? {
        willSet {
            guard let tabNumber = newValue else { return }
            pageLabel.text = "Tab\(tabNumber)"
        }
    }
    
    override var isSelected: Bool {
        willSet {
            pageLabel.textColor = newValue ? .black : .lightGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(pageLabel)
        self.backgroundColor = .green
        pageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setIndex(_ index: Int) {
        indexPath = index
    }
}
