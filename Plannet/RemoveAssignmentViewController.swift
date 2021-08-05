//
//  RemoveAssignmentViewController.swift
//  Plannet
//
//  Created by Vanessa Zhang on 8/5/21.
//

import UIKit
import CoreData
class RemoveAssignmentViewController: UIViewController {
    var previousVC = TableViewController()
    @IBOutlet weak var deletePrompt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "plannetBackground.png")!)
        // Do any additional setup after loading the view.
    }
    
    var selectedAssignment : AssignmentCD?

    @IBAction func yes(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theAssignment = selectedAssignment {
              context.delete(theAssignment)
              navigationController?.popViewController(animated: true)
            }
          }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
