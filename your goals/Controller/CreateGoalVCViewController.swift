//
//  CreateGoalVCViewController.swift
//  your goals
//
//  Created by Amajd Oudeh on 27.06.22.
//

import UIKit

class CreateGoalVCViewController: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        print("next")
    }
    
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        print("short")
    }
    
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        print("long")
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        print("dismiss")
        dismiss(animated: true)
    }
}
