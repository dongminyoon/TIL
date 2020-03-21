//
//  ViewController.swift
//  StickyHeaderPractice
//
//  Created by 윤동민 on 2020/03/21.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var customHeaderView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    private let initHeightConstraint: CGFloat = -200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customTableView.contentInsetAdjustmentBehavior = .never
        customTableView.contentInset = UIEdgeInsets(top: customHeaderView.frame.height, left: 0, bottom: 0, right: 0)
        customTableView.delegate = self
        customTableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else { return UITableViewCell() }
        customCell.setTitle("item\(indexPath.row)")
        customCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return customCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > initHeightConstraint && contentOffsetY < -130 {
            heightConstraint.constant = -contentOffsetY
        } else if contentOffsetY < initHeightConstraint {
            heightConstraint.constant = -contentOffsetY
        } else { return }
    }
}

