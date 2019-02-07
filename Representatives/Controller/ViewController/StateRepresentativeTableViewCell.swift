//
//  StateRepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Dominic Lanzillotta on 2/7/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import UIKit

class StateRepresentativeTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    //MARK: - landingPad
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    //MARK: - Private Functions
    func updateViews() {
        guard let representative = representative else {return}
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        phoneLabel.text = representative.phone
        adressLabel.text = representative.office
        websiteLabel.text = representative.link
        districtLabel.text = representative.district
        if representative.party == "Republican" {
            backgroundColor = UIColor.brown.withAlphaComponent(0.5)
        }
    }
    
}
