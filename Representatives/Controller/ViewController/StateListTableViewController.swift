//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Dominic Lanzillotta on 2/7/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        cell.textLabel?.text = States.all[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toDetailTVC" {
            guard let index = tableView.indexPathForSelectedRow else {return}
            if let destinationTVC = segue.destination as? StateDetailTableViewController {
                destinationTVC.state = States.all[index.row]
            }
        }
    }
}
