//
//  WeatherInformationTableViewController.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/4/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherInformationTableViewController: UITableViewController
{
    var arrayWeather : [WeatherInformation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        fetchDataUsingBlocks()
    }

    func setUpUI(){
        self.tableView.tableFooterView = UIView()   //To remove empty cells in UITableView
    }
    
    func fetchDataUsingBlocks(){
        self.getWeatherInformationOfCityID(cityIdentifier: Sydney_ID) {
            self.getWeatherInformationOfCityID(cityIdentifier: Melbourne_ID, successBlock: {
                self.getWeatherInformationOfCityID(cityIdentifier: Brisbane_ID, successBlock: {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()     //Reloading the tableview on main thread
                    }
                    
                })
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - User defined methods
    func getWeatherInformationOfCityID(cityIdentifier : String, successBlock:@escaping () -> Void){
        WebServiceHandler.sharedInstance.getWeatherInformation(cityID: cityIdentifier, successBlock: { (result) in
            self.arrayWeather.append(result)
            successBlock()
        }) { (error) in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherInformationTableViewCell", for: indexPath) as! WeatherInformationTableViewCell
        cell.configureCellWithData(weatherInformationModelObject: arrayWeather[indexPath.row])
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailScreenObject : WeatherDetailInformationViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeatherDetailInformationViewController") as! WeatherDetailInformationViewController
        weatherDetailScreenObject.selectedWeatherInformationObject = arrayWeather[indexPath.row]
        self.navigationController?.pushViewController(weatherDetailScreenObject, animated: true)    //Alternatively, we can use prepare for segue method
    }

}
