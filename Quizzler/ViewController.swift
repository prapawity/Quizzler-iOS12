//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dataQuestion = AllQuestion()
    var point = 0
    var question_state = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    
    var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        alert.addAction(UIAlertAction(title: "Next", style: .default, handler: nil))
        
    }
    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(answer: sender.tag)
        nextQuestion()
        if question_state == dataQuestion.listQuestion.count-1{
            trueBtn.isHidden = true
            falseBtn.isHidden = true
            restartBtn.isHidden = false
        }
    }
    
    
    func updateUI() {
        questionLabel.text = dataQuestion.listQuestion[question_state].question_name
        scoreLabel.text = "Score: \(point)"
        progressLabel.text = "\(question_state+1)/\(dataQuestion.listQuestion.count)"
        progressBar.frame.size.width = CGFloat(CGFloat((Int(UIScreen.main.bounds.width) / dataQuestion.listQuestion.count)) * CGFloat(question_state+1))
    }
    
    
    func nextQuestion() {
        question_state += 1
        updateUI()
    }
    
    
    func checkAnswer(answer: Int) {
        alert.title = "❤️"
        switch answer {
        case 1:
            if dataQuestion.listQuestion[question_state].ans == true{
                point += 1
            }
            else{
                alert.title = "😡"
            }
        case 2:
            if dataQuestion.listQuestion[question_state].ans == false{
                point += 1
            }
            else{
                alert.title = "😡"
            }
        default:
            alert.title = "😡"
            
        }
        self.present(alert,animated: true)
    }
    func startOver() {
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        restartBtn.isHidden = true
        point = 0
        question_state = 0
        updateUI()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func Restart(_ sender: Any) {
        let end = UIAlertController(title: "Ending", message: "Do u want to restart", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        end.addAction(action1)
        self.present(end,animated: true)
    }
    
    
    
}
