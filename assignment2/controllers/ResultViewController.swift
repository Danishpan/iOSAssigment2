//
//  ResultViewController.swift
//  assignment2
//
//  Created by Даир Алаев on 30.01.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    var resultScore: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "Your result is " + resultScore
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func restartQuiz(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func openHistory(_ sender: Any) {
        let tvc = storyboard?.instantiateViewController(identifier: "HistoryTableViewController") as! HistoryTableViewController
        navigationController?.pushViewController(tvc, animated: true)
    }
    
    @IBAction func returnHome(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
