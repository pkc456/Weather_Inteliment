//
//  WeatherDetailInformationViewController.swift
//  Weather
//
//  Created by Pradeep Choudhary on 3/6/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class WeatherDetailInformationViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var imageViewTemperature: UIImageView!
    var selectedWeatherInformationObject : WeatherInformation!
    
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelWeatherDescription: UILabel!
    @IBOutlet weak var collectionViewWeatherDetail: UICollectionView!

    final let totalNumberOfItemsInCollectionView = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.navigationItem.title = selectedWeatherInformationObject.name
        
        labelTemperature.text = "\(selectedWeatherInformationObject.main.temp)°"
        labelWeatherDescription.text = selectedWeatherInformationObject.weather[0].description
        
        //Set image according to temperature
        self.setTemperatureImage(weatherType: selectedWeatherInformationObject.weather[0].main)
        collectionViewWeatherDetail.reloadData()
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
        }else if(weatherType.contains("Snow")){
            imageName = "SnowSky"
        }else{
            imageName = "ClearSky"
        }
        
        imageViewTemperature.image = UIImage(named: imageName)
    }
    
    override func didReceiveMemoryWarning() {
    }    

    //MARK: Collection view datasource and delegates
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalNumberOfItemsInCollectionView
    }
    
    //To center align the collection view, I implement below method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let height :CGFloat = 80.0
        let width = collectionView.frame.size.width/CGFloat(totalNumberOfItemsInCollectionView)
        return CGSize(width: width, height: height)
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WeatherDetailInformationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDetailInformationCollectionViewCell", for: indexPath) as! WeatherDetailInformationCollectionViewCell
        let cellData = self.getData(row: indexPath.row)
        cell.configureCellWithData(detailText: cellData.detailText, imageName: cellData.nameOfImage)
        return cell
    }
    
    //MARK: user defined methods
    
    //Using tuples, get the value corresponding to the cell
    private func getData(row : Int)-> (detailText:String,nameOfImage:String){
        var dataText = ""
        var imageName = ""
        
        switch row {
        case 0:
                dataText = "\(selectedWeatherInformationObject.main.humidity)%"
                imageName = "Humidity"
        case 1:
            dataText = "\(selectedWeatherInformationObject.main.temp_max)° \(selectedWeatherInformationObject.main.temp_min)°"
            imageName = "Temperature"
        case 2:
            dataText = "\(selectedWeatherInformationObject.wind.speed)m/s"
            imageName = "WindSpeed"
        default:
            dataText = "\(selectedWeatherInformationObject.main.humidity)%"
            imageName = "Humidity"
        }
        
        return (dataText,imageName)
    }
    
//    //Set attribute text on artist label
//    func getAttributedTextForTemperature(temperature : String){
//        let departureAttribute = [
//            NSFontAttributeName : UIFont.systemFont(ofSize: 13.0),
//            NSForegroundColorAttributeName : UIColor.darkGray,
//            ]
//        let departureAttributedString = NSMutableAttributedString(string: "By ", attributes: departureAttribute)
//        
//        let arrivalAttribute = [
//            NSFontAttributeName : UIFont.systemFont(ofSize: 13.0),
//            NSForegroundColorAttributeName : UIColor.red,
//            ]
//        let arrivalAttributedString = NSAttributedString(string: String(format: "%@", artistName), attributes: arrivalAttribute)
//        
//        departureAttributedString.append(arrivalAttributedString)
//        labelArtistName.attributedText = departureAttributedString
//    }
}
