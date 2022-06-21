import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalButton(_ sender: Any) {
        print("was pressed")
    }
}
