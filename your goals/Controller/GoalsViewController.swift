import UIKit
import CoreData

class GoalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        tableView.rowHeight = 65.0
    }

    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoalViewController = storyboard?.instantiateViewController(withIdentifier: "CreateGoalViewController") else {
            return
        }
        presentDetail(createGoalViewController)
    }
}

extension GoalsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell
        else { return UITableViewCell()
        }
        cell.configureCell(description: "Eat Salad twice a week", type: GoalType.ShortTerm, goalProgressAmount: 2)
        return cell
    }
}
