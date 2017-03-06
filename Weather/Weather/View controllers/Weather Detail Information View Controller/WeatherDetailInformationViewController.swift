//
//  WeatherDetailInformationViewController.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/6/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherDetailInformationViewController: UIViewController {

    @IBOutlet weak var imageViewTemperature: UIImageView!
    var selectedWeatherInformationObject : WeatherInformation!
    @IBOutlet weak var labelTemperature: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.navigationItem.title = selectedWeatherInformationObject.name
        
        let temperatureString = "\(selectedWeatherInformationObject.main.temp_max) - \(selectedWeatherInformationObject.main.temp_min)"
        setTextOn(label: labelTemperature, text: temperatureString, imageName: "Temperature")
        
        //Set image according to temperature
        self.setTemperatureImage(weatherType: selectedWeatherInformationObject.weather[0].main)
    }

    //Generic method which sets the text and image on label
    private func setTextOn(label : UILabel, text : String, imageName:String){
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: text)
        myString.append(attachmentString)
        label.attributedText = myString
    }
    
    //Set image according to the temperature
    private func setTemperatureImage(weatherType : String)
    {
        var imageName : String = ""
        
        if(weatherType.contains("Clouds")){
            imageName = "CloudySky"
        }else if(weatherType.contains("Clear")){
            imageName = "ClearSky"
        }else if(weatherType.contains("Rain")){
            imageName = "RainSky"
        }else if(weatherType.contains("Squall")){
            imageName = "SquallSky"
        }else if(weatherType.contains("Drizzle")){
            imageName = "DrizzleSky"
        }else{
            imageName = "ClearSky"
        }
        
        imageViewTemperature.image = UIImage(named: imageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

}
