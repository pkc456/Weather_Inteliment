//
//  WeatherDetailInformationCollectionViewCell.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/8/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherDetailInformationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewWeatherDetail: UIImageView!
    @IBOutlet weak var labelWeatherDetail: UILabel!
    
    func configureCellWithData(detailText : String, imageName: String)
    {
        labelWeatherDetail.text = detailText
        imageViewWeatherDetail.image = UIImage(named: imageName)
    }
}
