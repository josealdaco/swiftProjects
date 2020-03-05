//
//  FavoritesSection.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

struct FavoritesSection: Section {
    let numberOfItemsList:[FavoritesModel] = [FavoritesModel(image: UIImage(named: "tooth")!, item: "Code", bio: "Get teeth cleaned"),FavoritesModel(image: UIImage(named: "search")!, item: "Code", bio: "Search for cheap prices"),FavoritesModel(image: UIImage(named: "code")!, item: "Code", bio: "Advance technologies"),FavoritesModel(image: UIImage(named: "gym")!, item: "Code", bio: "Exercise"),FavoritesModel(image: UIImage(named: "heart")!, item: "Code", bio: "Care and Love"),]
    let numberOfItems = 5
    func layoutSection() -> NSCollectionLayoutSection? {
        
        // TODO: Step 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.3)) //size of item
        
        // TODO: Step 2
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 6.7, leading: 10.0, bottom: 6.7, trailing: 10.0)

        // TODO: Step 3. Try using 95% width and 35% height
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        // TODO: Step 4. You will need to specify how many items per group (3)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // TODO: Step 5
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
       section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 10, bottom: 16, trailing: 10)
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FavoritesCell.self), for: indexPath) as! FavoritesCell
        //        cell.boxLabel.textColor = SettingsService.darkGrayColor
        cell.imgView.image = numberOfItemsList[indexPath.item].image
        cell.titleLabel.text = numberOfItemsList[indexPath.item].bio
        return cell
    }
}
