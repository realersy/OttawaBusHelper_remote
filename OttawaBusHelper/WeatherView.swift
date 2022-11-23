//
//  WeatherView.swift
//  OttawaBusHelper
//
//  Created by Ersan Shimshek on 16.11.2022.
//
//45.420015, -75.689539 Coordinates of Ottawa
// API call https://api.openweathermap.org/data/2.5/weather?q=Ottawa&appid=5bf61704b3905dfd0002f0f494760d6b&units=metric

import Foundation
import UIKit

public class WeatherView: UIView {
    
    struct Forecast: Codable {
        
        struct Main: Codable {
            let temperature: Double
        }
        let temp: [Main]
        
    }
    
    public var tempLabel:UILabel!
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        tempLabel = UILabel(frame: frame)
        tempLabel.textAlignment = .center
        tempLabel.textColor = UIColor.black
        addSubview(tempLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
