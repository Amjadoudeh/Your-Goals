import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!

    @IBOutlet weak var completionView: UIView!

    func configureCell(goal: Goal) {
        centerGoalCell()
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(goal.goalProgress)

        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }

    func centerGoalCell() {
    // goalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
     //   goalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
      }
}
