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
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    func save(completion: (_ finished: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)

        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = 0
        goal.goalProgress = Int32(pointsTextField.text!)!

        do {
            try managedContext.save()
            print("successed")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
