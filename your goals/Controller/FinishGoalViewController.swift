import UIKit
import CoreData

class FinishGoalViewController: UIViewController {

    @IBOutlet weak var createGoalButton: UIButton!

    @IBOutlet weak var pointsTextField: UITextField!

    var goalDescription: String!
    var goalType: GoalType!

    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func createGoalButtonWasPressed(_ sender: Any) {
        // Pass data into Core Data Goal Model
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }

    func save(completion: (_ finished: Bool) -> Void) {

    }
}
