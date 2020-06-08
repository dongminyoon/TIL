//
//  IndicatorCollectionViewDataSource.swift
//  CustomTabbarPractice
//
//  Created by 윤동민 on 2020/04/30.
//  Copyright © 2020 윤동민. All rights reserved.
//

import UIKit

class IndicatorCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
