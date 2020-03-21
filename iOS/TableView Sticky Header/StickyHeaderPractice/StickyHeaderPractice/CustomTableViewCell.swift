//
//  CustomTableViewCell.swift
//  StickyHeaderPractice
//
//  Created by 윤동민 on 2020/03/21.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "customCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    private var title: String? {
        willSet {
            self.titleLabel.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }

}
