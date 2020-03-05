//
//  FeaturedSection.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//
import UIKit

struct FeaturedSection: Section {
    let numberOfItemsList:[ServicesModel] =  [ServicesModel(image: UIImage(named: "food")!, title: "DINNER" ),ServicesModel(image: UIImage(named: "pill")!, title: "MEDICINE" ),ServicesModel(image: UIImage(named: "sleep")!, title: "NIGHT TIME" ),ServicesModel(image: UIImage(named: "gym")!, title: "EXERCISE" ),ServicesModel(image: UIImage(named: "bulb")!, title: "IDEAS" ),]
    let numberOfItems: Int = 5
    
    func layoutSection() -> NSCollectionLayoutSection? {
        // TODO: Step 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)) //width
        
        // TODO: Step 2
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // TODO:Step 3: Try using the absolute values, around 200 by 300
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)) //height
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // TODO: Step 5
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedCell.self), for: indexPath) as! FeaturedCell
        cell.imgView.image = numberOfItemsList[indexPath.item].image
        cell.titlelabel.text = numberOfItemsList[indexPath.item].title
        
        
        //layer.borderColor = CGColor(srgbRed: 0/255, green: 100/255, blue: 150/255, alpha: 1)
//        cell.contentView.layer.borderColor = UIColor.red.cgColor
        return cell
    }
}
