import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var goals: [Goal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        tableView.rowHeight = 80.0
        navigationController?.isNavigationBarHidden = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }

    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoalViewController = storyboard?.instantiateViewController(withIdentifier: "CreateGoalViewController") else {
            return
        }
        navigationController?.pushViewController(createGoalViewController, animated: true)
    }
}

extension GoalsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell
        else { return UITableViewCell()
    }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (_, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }

        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (_, indexPath) in
            self.setProgress(IndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }

        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.961445272, green: 0.650790751, blue: 0.1328578591, alpha: 1)

        return [deleteAction, addAction]
    }

}

extension GoalsViewController {
    func setProgress(IndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

        let chosenGoal = goals[indexPath.row]

        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else {
            return
        }
        do {
            try managedContext.save()
            print("set progress successed")
        } catch {
            debugPrint("Could not set progress: \(error.localizedDescription)")
        }
    }

    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

        managedContext.delete(goals[indexPath.row])

        do {
            try managedContext.save()
            print("removed")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }

    func fetch(completion: (_ complete: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")

        do {
            goals = try managedContext.fetch(fetchRequest)
            print("data fetched")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}
