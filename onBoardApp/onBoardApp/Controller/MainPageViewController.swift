//
//  MainPageViewController.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 3/5/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

   var collectionView: UICollectionView!
        
        lazy var sections: [Section] = [
            TitleSection(title: "Services"),
//            BasicGridSection(),
            FeaturedSection(),
            FavoritesSection(),
            
        ]
        
        lazy var collectionViewLayout: UICollectionViewLayout = {
            var sections = self.sections
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                return sections[sectionIndex].layoutSection()
            }
            return layout
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Compositional Layout"
            self.view.backgroundColor = UIColor.black
            setupCollectionView()
        }
        
        func setupCollectionView() {
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
            collectionView.dataSource = self as UICollectionViewDataSource
            collectionView.delegate = self as? UICollectionViewDelegate
            collectionView.backgroundColor = UIColor.darkGray
            collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
            collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
            collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: FavoritesCell.identifier)
            collectionView.register(UINib(nibName: "GridCell", bundle: .main), forCellWithReuseIdentifier: GridCell.identifier)
            self.view.addSubview(collectionView)
            collectionView.reloadData()
        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            collectionView.reloadData()
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            collectionView.reloadData()
        }
    }

    extension MainPageViewController: UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            sections.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            sections[section].numberOfItems
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
