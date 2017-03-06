//
//  WeatherInformationBusinessLayer.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/5/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherInformationBusinessLayer: NSObject
{
    class var sharedInstance: WeatherInformationBusinessLayer {
        struct Static {
            static let instance: WeatherInformationBusinessLayer = WeatherInformationBusinessLayer()
        }
        return Static.instance
    }
    
    func parseArrayJsonData(data: Dictionary<String, Any>) -> (WeatherInformation) {
        let modelObject: WeatherInformation = WeatherInformation(json: data)!
        return modelObject
    }
}
