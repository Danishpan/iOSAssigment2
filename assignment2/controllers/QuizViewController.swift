//
//  QuizViewController.swift
//  assignment2
//
//  Created by Даир Алаев on 28.01.2021.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    var quizQuestions = [Question]()
    var currentQuestion: Question?
    var currentIndex: Int?
    var correctAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        currentQuestion = quizQuestions[0]
        currentIndex = 1
        setupUI(question: currentQuestion!)
        // Do any additional setup after loading the view.
    }
    
    func setupQuestions() {
        quizQuestions.append(Question(text: "Capital city of Latvia?", answers:
            [Answer(text: "Daugavpils", correctness: false),
             Answer(text: "Riga", correctness: true),
             Answer(text: "Liepaja", correctness: false),
             Answer(text: "Jelgava", correctness: false)]))
        
        quizQuestions.append(Question(text: "Capital city of Afghanistan?", answers: [Answer(text: "Kabul", correctness: true),
             Answer(text: "Herat", correctness: false),
             Answer(text: "Jalalabad", correctness: false),
             Answer(text: "Kandahar", correctness: false)]))
        
        quizQuestions.append(Question(text: "Capital city of Australia?", answers: [Answer(text: "Sydney", correctness: false),
             Answer(text: "Melbourne", correctness: false),
             Answer(text: "Canberra", correctness: true),
             Answer(text: "Adelaide", correctness: false)]))
        
        quizQuestions.append(Question(text: "Capital city of Brazil?", answers:
            [Answer(text: "Salvado", correctness: false),
             Answer(text: "Sao Paulo", correctness: false),
             Answer(text: "Rio de Janeiro", correctness: false),
             Answer(text: "Brasilia", correctness: true)]))
    }
    
    func setupUI(question: Question){
        questionLabel.text = question.text
        indexLabel.text = "Question " + String(currentIndex!) + "/" + String(quizQuestions.count)
        answer1.setTitle(question.answers[0].text, for: .normal)
        answer2.setTitle(question.answers[1].text, for: .normal)
        answer3.setTitle(question.answers[2].text, for: .normal)
        answer4.setTitle(question.answers[3].text, for: .normal)
        //print(String(correctAnswers) , "/" , String(quizQuestions.count))
    }
    
    func checkAnswer(question: Question, answer: String) -> Bool {
        if (question.answers.first{$0.correctness == true}?.text == answer) {
            if currentIndex! < quizQuestions.count {
                currentQuestion = quizQuestions[quizQuestions.firstIndex(where: {$0.text == question.text})!+1]
            }
            return true
        } else {
            return false
        }
    }
    
    func resetAnswers() {
        answer1.backgroundColor = UIColor.systemPurple
        answer2.backgroundColor = UIColor.systemPurple
        answer3.backgroundColor = UIColor.systemPurple
        answer4.backgroundColor = UIColor.systemPurple
    }

   
    @IBAction func button1Clicked(_ sender: Any) {
        if checkAnswer(question: currentQuestion!, answer: answer1.currentTitle!) {
            resetAnswers()
            correctAnswers = correctAnswers + 1
            answer1.backgroundColor = UIColor.systemGreen
        } else {
            resetAnswers()
            answer1.backgroundColor = UIColor.red
        }
    }
    @IBAction func button2Clicked(_ sender: Any) {
        if checkAnswer(question: currentQuestion!, answer: answer2.currentTitle!) {
            resetAnswers()
            correctAnswers = correctAnswers + 1
            answer2.backgroundColor = UIColor.systemGreen
        } else {
            resetAnswers()
            answer2.backgroundColor = UIColor.red
        }
    }
    @IBAction func button3Clicked(_ sender: Any) {
        if checkAnswer(question: currentQuestion!, answer: answer3.currentTitle!) {
            resetAnswers()
            correctAnswers = correctAnswers + 1
            answer3.backgroundColor = UIColor.systemGreen
        } else {
            resetAnswers()
            answer3.backgroundColor = UIColor.red
        }
    }
    @IBAction func button4Clicked(_ sender: Any) {
        if checkAnswer(question: currentQuestion!, answer: answer4.currentTitle!) {
            resetAnswers()
            correctAnswers = correctAnswers + 1
            answer4.backgroundColor = UIColor.systemGreen
        } else {
            resetAnswers()
            answer4.backgroundColor = UIColor.red
        }
    }
    
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentIndex = currentIndex! + 1
        if currentIndex! - 1 < quizQuestions.count{
            currentQuestion = quizQuestions[currentIndex! - 1]
            setupUI(question: currentQuestion!)
            resetAnswers()
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            vc.resultScore = String(correctAnswers) + "/" + String(quizQuestions.count)
            HistoryTableViewController.attempts.append(String(correctAnswers) + "/" + String(quizQuestions.count))
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correctness: Bool
    
}
