//
//  ReminderCell.swift
//  Reminders
//
//  Created by Mihai Damian on 27/03/2018.
//  Copyright © 2018 Mihai Damian. All rights reserved.
//

import Foundation
import UIKit

protocol ReminderCellDelegate {
    func didChangeReminderTitle(cell: ReminderCell, title: String)
}

class ReminderCell: UITableViewCell {
    
    @IBOutlet var titleInput: UITextField!
    var delegate: ReminderCellDelegate?
}

extension ReminderCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleInput.resignFirstResponder()
        delegate?.didChangeReminderTitle(cell: self, title: titleInput.text ?? "")
        return true
    }
}
