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
    @IBOutlet weak var labelTest: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.navigationItem.title = selectedWeatherInformationObject.name
        
        setTextUsingAnimation()
        self.setTemperatureImage(weatherType: selectedWeatherInformationObject.weather[0].main)
    }

    private func setTextUsingAnimation(){
//        UIView.transition(with: self.labelTest,
//                                  duration: 1.2,
//                                  options: [.curveEaseInOut, .transitionCrossDissolve],
//                                  animations: { () -> Void in
//                                    self.labelTest.text = "80 % "
//        }, completion: nil)
        
//        let animation: CATransition = CATransition()
//        animation.duration = 1.0
//        animation.type = kCATransitionFade
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        labelTest.layer.addAnimation(animation, forKey: "changeTextTransition")
    }
    
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
