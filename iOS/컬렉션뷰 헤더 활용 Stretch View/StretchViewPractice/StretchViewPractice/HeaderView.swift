//
//  HeaderView.swift
//  StickyViewPractice
//
//  Created by 윤동민 on 2020/03/20.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var logoImageView: UIImageView!
    
    static let identifier = "headerView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
