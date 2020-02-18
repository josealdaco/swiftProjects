//
//  PastBoxes.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/17/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class PastBoxes: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
 
    let boxesArray = [String](repeating: "Dummy Data", count: 10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(boxesArray[indexPath.row])"
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
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
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
