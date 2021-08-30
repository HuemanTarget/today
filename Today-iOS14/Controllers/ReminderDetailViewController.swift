//
//  ReminderDetailViewController.swift
//  Today-iOS14
//
//  Created by Joshua Basche on 8/29/21.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
  
  enum ReminderRow: Int, CaseIterable {
    case title
    case date
    case notes
    case time
    
    func displayText(for reminder: Reminder?) -> String? {
      switch self {
      case .title:
        return reminder?.title
      case .date:
        return reminder?.dueDate.description
      case .notes:
        return reminder?.notes
      case .time:
        return reminder?.dueDate.description
      }
    }
    
    var cellImage: UIImage? {
      switch self {
      case .title:
        return nil
      case .date:
        return UIImage(systemName: "calendar.circle")
      case .notes:
        return UIImage(systemName: "sqaure.and.pencil")
      case .time:
        return UIImage(systemName: "clock")
      }
    }
  }
  
  var reminder: Reminder?
  
  func configure(with reminder: Reminder) {
    self.reminder = reminder
  }
}

extension ReminderDetailViewController {
  static let reminderDetailCellIdentifier = "ReminderDetailCell"
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ReminderRow.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath)
    let row = ReminderRow(rawValue: indexPath.row)
    
    cell.textLabel?.text = row?.displayText(for: reminder)
    cell.imageView?.image = row?.cellImage
    
    return cell
  }
}
