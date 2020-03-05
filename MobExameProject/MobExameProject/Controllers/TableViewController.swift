//
//  TableViewController.swift
//  MobExameProject
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let boxesArray:[User] = [ User(firstName: "Jimi", lastName: "Hendrix", age: 50),
           User(firstName: "Eddi", lastName: "Van Halen", age: 45),
           User(firstName: "John", lastName: "Lennon", age: 40),
           User(firstName: "Joan", lastName: "Jett", age: 38),
           User(firstName: "Brian", lastName: "May", age: 55),
           User(firstName: "Carlos", lastName: "Santana", age: 48)
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // Moves to different VC
        self.navigationController?.pushViewController(UserViewController(), animated: true)
          
      }
    let table: UITableView = {
          let table = UITableView()
          table.translatesAutoresizingMaskIntoConstraints = false
          table.rowHeight = 100
          return table
       }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
         setTable()
        // Do any additional setup after loading the view.
    }

    func setTable(){
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifier)
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

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
