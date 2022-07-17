import UIKit

class CreateGoalVCViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    var goalType: GoalType = .ShortTerm

    override func viewDidLoad() {
        super.viewDidLoad()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
        goalTextView.delegate = self
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
            navigationController?.pushViewController(finishGoalViewController, animated: true)
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
