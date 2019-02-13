//
//  ViewController.swift
//  Reminders
//
//  Created by Cal Stephens on 2/11/18.
//  Copyright © 2018 GT iOS Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var reminders = [Reminder]()
    
    // MARK: User Interaction
    
    @IBAction func addReminder() {
        let alert = UIAlertController(title: "New Reminder", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Reminder"
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            guard let reminderText = alert.textFields?.first?.text,
                !reminderText.isEmpty else
            {
                return
            }
            
            self.reminders.append(Reminder(text: reminderText, completed: false))
            self.tableView.reloadData()
        }))
        
        present(alert, animated: true)
    }
    
}

// MARK: Table View Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.item]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = reminder.text
        
        if reminder.completed {
            cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.5
        } else {
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            reminders.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reminders[indexPath.item].toggleCompleted()
        tableView.reloadData()
    }
    
}
