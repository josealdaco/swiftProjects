//
//  ViewController.swift
//  MobExam13
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let users: [User] = [
        User(firstName: "Jimi", lastName: "Hendrix", age: 50),
        User(firstName: "Eddi", lastName: "Van Halen", age: 45),
        User(firstName: "John", lastName: "Lennon", age: 40),
        User(firstName: "Joan", lastName: "Jett", age: 38),
        User(firstName: "Brian", lastName: "May", age: 55),
        User(firstName: "Carlos", lastName: "Santana", age: 48)
    ]
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 80
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    
    override func loadView() {
        super.loadView()
        title = "😁 Final Exam 😁"
        setupViews()
        view.backgroundColor = .black
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .black
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        table.tableFooterView = UIView()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: UserDetailsVC = UserDetailsVC()
        vc.user = users[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        let userObject = users[indexPath.row]
        cell.populateCell(user: userObject)
        return cell
    }
}
