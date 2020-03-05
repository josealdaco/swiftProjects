//
//  Section.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
