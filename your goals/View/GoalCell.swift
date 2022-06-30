import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var goalStackView: UIStackView!

    func configureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type.rawValue
        self.goalProgressLabel.text = String(describing: goalProgressAmount)
        centerGoalCell()
    }

    func centerGoalCell() {
       goalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
      }
}
