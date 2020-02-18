//
//  CustomFlowLayout.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/18/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//


import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        //self.itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width, height: 70.0)
        self.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.sectionInsetReference = .fromSafeArea
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
//        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
//        let minColumnWidth = CGFloat(300)
//        let maxNumColumns = Int(availableWidth/minColumnWidth)
//        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down) - 100
        let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 250)

        self.itemSize = size

    }

}
