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
            tableView.reloadData()
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

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE") { _, _, completion in
           tableView.deleteRows(at: [indexPath], with: .automatic)
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.tableView.reloadData()
            completion(true)

        }
        let addAction = UIContextualAction(style: .normal, title: "ADD") { _, _, completion in
            self.setProgress(IndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
            completion(true)
        }
        addAction.backgroundColor = UIColor.orange
        return UISwipeActionsConfiguration(actions: [deleteAction, addAction])
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
