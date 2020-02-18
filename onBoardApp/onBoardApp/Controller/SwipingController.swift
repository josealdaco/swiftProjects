//
//  SwipingController.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 1/29/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController,  UICollectionViewDelegateFlowLayout {
    /* Swiping feature in UI*/
    
    let pages = [
        Page(imageName: "climate_change" , headerText: "We will channge the world", bodyText: "Green earth, hapy life"),
        Page(imageName: "helping_hand", headerText: "Remember to always give a helping hand", bodyText: "Helping one, help a million"),
        Page(imageName: "water_droplets", headerText: "Reduce the amount of water you cconsume", bodyText: "")
    ]
    
    
//    let imageNames = ["climate_change", "helping_hand", "water_droplets"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        print(indexPath.item)
        if indexPath.item == pages.count-1{
            cell.login_Button.isHidden = false
            cell.login_Button.addTarget(self, action: #selector(nextWindow), for: .touchUpInside)

        }
       // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green   Left is true, right is Even. Also remember if asked in an Interview
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    @objc func nextWindow(){
//        print("new Window")
        let navigationController = UINavigationController(rootViewController: HomePage() )
        navigationController.topViewController?.title = "HOMESCREEN"
        self.view.window!.rootViewController = navigationController //you can set it as root
        
    }
}
