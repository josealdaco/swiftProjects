//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    var habitImage: Habit.Images!

    @IBOutlet weak var habitNameInputField: UITextField!
    @IBOutlet weak var habitImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

           updateUI()
       }

       private func updateUI() {
           title = "New Habit"
           habitImageView.image = habitImage.image
       }

    @IBAction func createHabbitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
               guard let habitText = habitNameInputField.text else { return }
               persistenceLayer.createNewHabit(name: habitText, image: habitImage)
               self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
