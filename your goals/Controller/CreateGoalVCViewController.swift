import UIKit

class CreateGoalVCViewController: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    var goalType: GoalType = .ShortTerm

    override func viewDidLoad() {
        super.viewDidLoad()
        // nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
         dismissDetail()
    }

    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        print("short")
        goalType = .ShortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }

    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        print("long")
        goalType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
    }

    @IBAction func nextButtonWasPressed(_ sender: Any) {
        print("next")
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalViewController = storyboard?.instantiateViewController(withIdentifier: "FinishGoalViewController") as? FinishGoalViewController else { return }
            finishGoalViewController.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalViewController)
        }
    }
}
