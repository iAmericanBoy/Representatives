//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Dominic Lanzillotta on 2/7/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    //MARK: - Properties
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var state: String?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else {return}
        RepresentativeController.searchRepresentatives(forState: state) { (list) in
            self.representatives = list
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? StateRepresentativeTableViewCell

        cell?.representative = representatives[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}
