//
//  TableViewController.swift
//  Plannet
//
//  Created by Vanessa Zhang on 8/4/21.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var assignments : [AssignmentCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "plannetBackground.png")!)
    }

    func getAssignments() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataAssignments = try? context.fetch(AssignmentCD.fetchRequest()) as? [AssignmentCD] {
                assignments = coreDataAssignments
                tableView.reloadData()
        }
      }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      getAssignments()
    }
    
    
    func makeAssignments () -> [PlannetClass] {
        let history = PlannetClass()
        history.subject = "history"
        history.name = "worksheet"
        history.daysTil = "5"
        history.difficulty = 0.5
        
        return [history]
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      let assignment = assignments[indexPath.row]

      performSegue(withIdentifier: "moveToDelete", sender: assignment)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let assignment = assignments[indexPath.row]

        cell.textLabel?.text = assignment.name
        cell.textLabel?.font = UIFont(name: "GillSans", size: 20.0)
        cell.textLabel?.textColor = UIColor(named: "TextColor")
    
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? UserInputViewController {
            addVC.previousVC = self
    }
        if let completeVC = segue.destination as? RemoveAssignmentViewController {
          if let assignment = sender as? AssignmentCD {
            completeVC.selectedAssignment = assignment
            /*not sure if "selectedToDo" translated too "selectedPlannetClass" or "selectedAssignment*/
            completeVC.previousVC = self
          }
        }
}
}
