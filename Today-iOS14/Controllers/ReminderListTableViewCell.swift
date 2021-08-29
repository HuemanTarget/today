//
//  ReminderListTableViewCell.swift
//  Today-iOS14
//
//  Created by Joshua Basche on 8/29/21.
//

import UIKit

class ReminderListTableViewCell: UITableViewCell {
  typealias DoneButtonAction = () -> Void
  
  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var doneButton: UIButton!
  
  var doneButtonAction: DoneButtonAction?

  @IBAction func doneButtonTriggered(_ sender: UIButton) {
    doneButtonAction?()
  }
}
