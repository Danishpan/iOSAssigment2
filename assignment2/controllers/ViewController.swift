//
//  ViewController.swift
//  assignment2
//
//  Created by Даир Алаев on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "quiz")
        // Do any additional setup after loading the view.
    }


    @IBAction func startAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func openHistory(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "HistoryTableViewController") as! HistoryTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

