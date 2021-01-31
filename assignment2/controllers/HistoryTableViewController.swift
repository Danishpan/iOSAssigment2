//
//  HistoryTableViewController.swift
//  assignment2
//
//  Created by Даир Алаев on 30.01.2021.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    static var attempts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HistoryTableViewController.attempts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = HistoryTableViewController.attempts[indexPath.row]
        
        return cell
    }
}
