//
//  JSONCompatible.swift
//  WeatherInformation
//
//  Created by Pardeep on 05/03/17.
//  Copyright © 2017 Pardeep. All rights reserved.
//
//  
//

import Foundation


protocol JSONCompatible {
    init?(json: [String: Any]?)
    init()
    init?(data: Data?)
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any]
}



