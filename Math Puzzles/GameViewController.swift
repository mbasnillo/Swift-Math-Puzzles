//
//  GameViewController.swift
//  Math Puzzles
//
//  Created by Miles R. Basnillo on 20/04/2018.
//  Copyright © 2018 Miles R. Basnillo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var puzzleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var score: Int = 0
    var life: Int = 3
    var op1: Int!
    var op2: Int!
    var operation: Int!
    var answer: Int!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        self.operation = self.randomNumber(upperBound: 4)
        switch operation {
        case 0:
            self.op1 = randomNumber(upperBound: 50)
            self.op2 = randomNumber(upperBound: 50)
            self.answer = self.op1 + self.op2
            self.puzzleLabel.text = "\(self.op1) + \(self.op2)"
            assignToButtons(answer: self.answer)
            break
        case 1:
            self.op1 = randomNumber(upperBound: 50)
            self.op2 = randomNumber(upperBound: 50)
            self.answer = self.op1 - self.op2
            self.puzzleLabel.text = "\(self.op1) - \(self.op2)"
            assignToButtons(answer: self.answer)
            break
        case 2:
            self.op1 = randomNumber(upperBound: 50)
            self.op2 = randomNumber(upperBound: 50)
            self.answer = self.op1 * self.op2
            self.puzzleLabel.text = "\(self.op1) * \(self.op2)"
            assignToButtons(answer: self.answer)
            break
        case 3:
            self.op1 = randomNumber(upperBound: 50)
            self.op2 = randomNumber(upperBound: 50)
            self.answer = self.op1 / self.op2
            self.puzzleLabel.text = "\(self.op1) / \(self.op2)"
            assignToButtons(answer: self.answer)
            break
        default: break
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (sender.tag == self.answer) {
            self.score = self.score + 1
            self.scoreLabel.text = "Score: \(self.score)"
            self.startButtonPressed(self.startButton)
        } else {
            self.life = self.life - 1
            if (self.life == 0) {
                self.lifeLabel.text = "Life: GAME OVER"
            } else {
                self.lifeLabel.text = "Life: \(self.life)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomNumber(upperBound: UInt32) -> Int {
        return Int(arc4random_uniform(upperBound))
    }
    
    func assignToButtons(answer: Int) -> Void {
        let correctPosition = self.randomNumber(upperBound: 4)
        
        let answer2: Int = self.randomNumber(upperBound: 200)
        let answer3: Int = self.randomNumber(upperBound: 200)
        let answer4: Int = self.randomNumber(upperBound: 200)
        
        switch correctPosition {
        case 0:
            self.button1.setTitle("\(self.answer!)", for: .normal)
            self.button1.tag = self.answer!
            self.button2.setTitle("\(answer2)", for: .normal)
            self.button2.tag = answer2
            self.button3.setTitle("\(answer3)", for: .normal)
            self.button3.tag = answer3
            self.button4.setTitle("\(answer4)", for: .normal)
            self.button4.tag = answer4
            break
        case 1:
            self.button1.setTitle("\(answer2)", for: .normal)
            self.button1.tag = answer2
            self.button2.setTitle("\(self.answer!)", for: .normal)
            self.button2.tag = self.answer!
            self.button3.setTitle("\(answer3)", for: .normal)
            self.button3.tag = answer3
            self.button4.setTitle("\(answer4)", for: .normal)
            self.button4.tag = answer4
            break
        case 2:
            self.button1.setTitle("\(answer3)", for: .normal)
            self.button1.tag = answer3
            self.button2.setTitle("\(answer2)", for: .normal)
            self.button2.tag = answer2
            self.button3.setTitle("\(self.answer!)", for: .normal)
            self.button3.tag = self.answer!
            self.button4.setTitle("\(answer4)", for: .normal)
            self.button4.tag = answer4
            break
        case 3:
            self.button1.setTitle("\(answer4)", for: .normal)
            self.button1.tag = answer4
            self.button2.setTitle("\(answer2)", for: .normal)
            self.button2.tag = answer2
            self.button3.setTitle("\(answer3)", for: .normal)
            self.button3.tag = answer3
            self.button4.setTitle("\(self.answer!)", for: .normal)
            self.button4.tag = self.answer!
            break
        default: break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
