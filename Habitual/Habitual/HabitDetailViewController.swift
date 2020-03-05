//
//  HabitDetailViewController.swift
//  Habitual
//
//  Created by Jose Arellanes on 3/3/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class HabitDetailViewController: UIViewController {
    var habit: Habit!
    var habitIndex: Int!

    private var persistence = PersistenceLayer()

    
    @IBOutlet weak var ImageViewIcon: UIImageView!
    
   
    @IBOutlet weak var labelCurrentStreak: UILabel!
    
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    
    @IBOutlet weak var labelStartingDate: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
            updateUI()
       }
    @IBOutlet weak var buttonAction: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressActionButton(_ sender: Any) {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    private func updateUI() {
           title = habit.title
           ImageViewIcon.image = habit.selectedImage.image
           labelCurrentStreak.text = "\(habit.currentStreak) days"
           labelTotalCompletions.text = String(habit.numberOfCompletions)
           labelBestStreak.text = String(habit.bestStreak)
           labelStartingDate.text = habit.dateCreated.stringValue

           if habit.completedToday {
               buttonAction.setTitle("Completed for Today!", for: .normal)
           } else {
               buttonAction.setTitle("Mark as Completed", for: .normal)
           }
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
