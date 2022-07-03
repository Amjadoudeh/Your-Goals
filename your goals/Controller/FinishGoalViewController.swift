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
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }

    func save(completion: (_ finished: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)

        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)

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
