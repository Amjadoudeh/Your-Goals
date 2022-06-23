import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!

    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type
        self.goalProgressLabel.text = String(describing: goalProgressAmount)
    }
}
