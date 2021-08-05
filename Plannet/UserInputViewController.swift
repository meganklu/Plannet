//
//  UserInputViewController.swift
//  Plannet
//
//  Created by Vanessa Zhang on 8/4/21.
//
//if the slider isn't working out, feel free to change it. I was just thinking the user could slide it to how difficult it is and the code could use the value from 0-1 or whatever the slider's numbers are

import UIKit
import CoreData

class UserInputViewController: UIViewController {
    var previousVC = TableViewController()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var daysTilTextField: UITextField!
    @IBOutlet weak var difficultySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "plannetBackground.png")!)

        // Do any additional setup after loading the view.
    }
    var assignments : [AssignmentCD] = []

    @IBAction func addTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
            let assignment = AssignmentCD(entity: AssignmentCD.entity(), insertInto: context)
            
            if let nameText = nameTextField.text {
                assignment.name = subjectTextField.text! + " - " + nameText
        }
            
            try? context.save()

               navigationController?.popViewController(animated: true)
       
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
}
