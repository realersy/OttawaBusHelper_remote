//
//  ViewController.swift
//  OttawaBusHelper
//
//  Created by Ersan Shimshek on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let w_view = WeatherView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        
        view.addSubview(w_view)
    }


}

