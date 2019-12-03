//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Gordon, Russell on 2019-12-03.
//  Copyright © 2019 Gordon, Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties, Outlets
    @IBOutlet weak var inputQuestionCount: UITextField!
    @IBOutlet weak var inputStudentAnswers: UITextField!
    @IBOutlet weak var inputCorrectAnswers: UITextField!
    @IBOutlet weak var outputResults: UITextView!
    
    // MARK: Methods
    
    // Runs when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func checkStudentAnswers(_ sender: Any) {
        
        // Clear prior output messages
        outputResults.text = ""
        
        // INPUT
        // 1. Get the number of questions on the test.
        //    Ensure the input provided is an integer.
        guard let questionCountAsString = inputQuestionCount.text, let questionCount = Int(questionCountAsString), questionCount > 0 else {
            outputResults.text = "Please enter an integer value greater than 0."
            return
        }
        
        // 2. Get the student answers
        guard let studentAnswers = inputStudentAnswers.text, studentAnswers.count == questionCount else {
            outputResults.text = "Please be sure you input exactly \(questionCount) student answers."
            return
        }
        
        // 3. Get the correct answers
        guard let correctAnswers = inputCorrectAnswers.text, correctAnswers.count == questionCount else {
            outputResults.text = "Please be sure you input exactly \(questionCount) answers for the answer key."
            return
        }
        
        
    }
    


}

