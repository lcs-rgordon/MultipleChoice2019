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
        
        // Put focus on first input field when program begins
        inputQuestionCount.becomeFirstResponder()
    }
    
    // MARK: Actions
    @IBAction func checkStudentAnswers(_ sender: Any) {
        
        // Clear prior output messages
        outputResults.text = ""
        
        // Define valid choices
        let validChoices = "ABCDE"
        
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
        
        // PROCESS & CHECK INPUT
        // Iterate over both strings and check to see if answers match up. When they do, increment the count of correct answers.
        var correctAnswerCount = 0
        for (position, studentAnswer) in studentAnswers.enumerated() {
            
            
            // Get index in each string
            let correctAnswerIndex = correctAnswers.index(correctAnswers.startIndex, offsetBy: position)
            
            // Get correct answer
            let correctAnswer = correctAnswers[correctAnswerIndex]
            
            // Check that student answers are valid
            if validChoices.contains(studentAnswer) == false {
                outputResults.text = "Student answers contain invalid choices. Please ensure that only characters A, B, C, D, or E are used."
                return
            } else if validChoices.contains(correctAnswer) == false {
                outputResults.text = "Correct answers contain invalid choices. Please ensure that only characters A, B, C, D, or E are used."
                return
            }

            // Compare student response to correct answer
            print("----")
            print("At character \(position)")
            print("Student answer is \(studentAnswer)")
            print("Correct answer is \(correctAnswer)")
            if studentAnswer == correctAnswer {
                correctAnswerCount += 1
            }
            
        }
        
        // OUTPUT
        // Indicate how many correct answers there are
        outputResults.text = "The student answered \(correctAnswerCount) question(s) correctly."
        
    }
    


}

