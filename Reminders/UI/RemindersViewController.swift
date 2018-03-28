//
//  RemindersViewController.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import UIKit
import ReSwift

class RemindersViewController: UITableViewController {
    
    var reminders: [Reminder]!
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count + 1
    }
    
    func isNewReminderIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.row == reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        cell.delegate = self
        if !isNewReminderIndexPath(indexPath: indexPath) {
            cell.titleInput.text = reminders[indexPath.row].description
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mainStore.dispatch(RemoveReminder(index: indexPath.row))
        }
    }
}

extension RemindersViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        reminders = state.reminders
        tableView.reloadData()
    }
}

extension RemindersViewController: ReminderCellDelegate {
    
    func didChangeReminderTitle(cell: ReminderCell, title: String) {
        let indexPath = tableView.indexPath(for: cell)!
        if isNewReminderIndexPath(indexPath: indexPath) {
            mainStore.dispatch(AddReminder(reminder: Reminder(description: title)))
        } else {
            let index = indexPath.row
            var reminder = reminders[index]
            reminder.description = title
            mainStore.dispatch(UpdateReminder(reminder: reminder, index: index))
        }
    }
}
