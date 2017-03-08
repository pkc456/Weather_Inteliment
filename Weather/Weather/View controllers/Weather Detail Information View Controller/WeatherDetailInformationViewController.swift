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
    
    final let totalNumberOfItemsInCollectionView = 6
    
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
        let width = collectionView.frame.size.width/CGFloat(totalNumberOfItemsInCollectionView/2)   //totalNumberOfItemsInCollectionView/2 to show 3 cells horizontal with equal spacing
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WeatherDetailInformationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDetailInformationCollectionViewCell", for: indexPath) as! WeatherDetailInformationCollectionViewCell
        let cellData = self.getData(row: indexPath.row)
        cell.configureCellWithData(detailText: cellData.detailText, imageName: cellData.nameOfImage)
        performCellAnimation(cell: cell)
        return cell
    }
    
    //Cell animation method
    private func performCellAnimation(cell:WeatherDetailInformationCollectionViewCell){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [],
                       animations: {
                        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        
        },
           completion: { finished in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: .curveEaseInOut,
                               animations: {
                                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                },
                               completion: nil
                )
            }
        )
    }
    
    //MARK: user defined methods
    
    private func getData(row : Int)-> (detailText:String,nameOfImage:String)    //Using tuples, get the value corresponding to the cell
    {
        var dataText = ""
        var imageName = ""
        
        switch row {
        case 0:
            dataText = "\(selectedWeatherInformationObject.main.humidity)%"
            imageName = "Humidity"
        case 1:
            dataText = "\(selectedWeatherInformationObject.main.temp_max)° : \(selectedWeatherInformationObject.main.temp_min)°"
            imageName = "Temperature"
        case 2:
            dataText = "\(selectedWeatherInformationObject.wind.speed)m/s"
            imageName = "WindSpeed"
        case 3:
            dataText = "\(selectedWeatherInformationObject.visibility)"
            imageName = "Visibility"
        case 4:
            let date = NSDate(timeIntervalSince1970: TimeInterval(selectedWeatherInformationObject.sys.sunrise))
            dataText = getTimeStringFromDate(date: date as Date)
            imageName = "Sunrise"
        case 5:
            let date = NSDate(timeIntervalSince1970: TimeInterval(selectedWeatherInformationObject.sys.sunset))
            dataText = getTimeStringFromDate(date: date as Date)
            imageName = "Sunset"
        default:
            dataText = "\(selectedWeatherInformationObject.main.humidity)%"
            imageName = "Humidity"
        }
        
        return (dataText,imageName)
    }
    
    private func getTimeStringFromDate(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let dataString = dateFormatter.string(from: date)
        return dataString
    }
}
