//
//  WeatherInformationTableViewCell.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/4/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTest: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configureCellWithData(weatherInformationModelObject : WeatherInformation)
    {
        labelTest.text = weatherInformationModelObject.name
    }
}
