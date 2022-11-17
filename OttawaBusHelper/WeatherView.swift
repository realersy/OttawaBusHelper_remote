//
//  WeatherView.swift
//  OttawaBusHelper
//
//  Created by Ersan Shimshek on 16.11.2022.
//

import Foundation
import UIKit

public class WeatherView: UIView {
    
    public var tempLabel:UILabel!
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        tempLabel = UILabel(frame: frame)
        tempLabel.textAlignment = .center
        tempLabel.textColor = UIColor.black
        tempLabel.text = "-5"
        
        let text  = tempLabel.text ?? "0"
        if (Int(text) ?? 0 > 25) {
                tempLabel.backgroundColor = UIColor.red
        }
        
        else if (Int(text) ?? 0 > 0 && Int(text) ?? 0 < 12) {
                tempLabel.backgroundColor = UIColor.systemBlue
        }
        else if (Int(text) ?? 0 >= 12 && Int(text) ?? 0 <= 25) {
                tempLabel.backgroundColor = UIColor.systemOrange
        }
        
        else if (Int(text) ?? 0 <= 0) {
                tempLabel.backgroundColor = UIColor.blue
        }
        addSubview(tempLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
