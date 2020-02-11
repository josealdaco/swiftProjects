//
//  ViewController.swift
//  TableView_Practice
//
//  Created by Jose Arellanes on 2/6/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let alienArray = [String](repeating: "👽 invading  🌎", count: 100)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alienArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlienCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(alienArray[indexPath.row])"
        return cell
    }
    

    
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setTable()
        // Do any additional setup after loading the view.
    }

    
        func setTable(){
            self.view.addSubview(table)
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
            table.register(AlienCell.self, forCellReuseIdentifier: "AlienCell")
            table.delegate = self
            table.dataSource = self

        }

}

