//
//  CountriesDataTableViewCell.swift
//  Covid
//
//  Created by user on 4/22/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit

class CountriesDataTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
