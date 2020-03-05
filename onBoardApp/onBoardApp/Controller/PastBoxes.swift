//
//  PastBoxes.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/17/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class PastBoxes: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
 
    let boxesArray: [ServicesModel] =  [ServicesModel(image: UIImage(named: "food")!, title: "January" ),ServicesModel(image: UIImage(named: "food")!, title: "July" ),ServicesModel(image: UIImage(named: "food")!, title: "March" ),ServicesModel(image: UIImage(named: "food")!, title: "October" ),ServicesModel(image: UIImage(named: "food")!, title: "December" ),]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath)
        cell.textLabel?.text = boxesArray[indexPath.item].title
        let imgView = UIImageView()
        imgView.image = boxesArray[indexPath.item].image
        cell.addSubview(imgView)
        cell.backgroundColor = .darkGray
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            self.navigationController?.pushViewController(FavoriteList(), animated: true)
        
    }
    
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
        table.addSubview(UIImageView())
        table.backgroundColor = .darkGray
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        setTable()
        // Do any additional setup after loading the view.
    }
    

    func setTable(){
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(PastBoxesTable.self, forCellReuseIdentifier: "BoxCell")
        table.delegate = self
        table.dataSource = self

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
