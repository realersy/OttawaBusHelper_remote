//
//  ViewController.swift
//  OttawaBusHelper
//
//  Created by Ersan Shimshek on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let w_view = WeatherView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let url  = "https://api.openweathermap.org/data/2.5/weather?q=Ottawa&appid=5bf61704b3905dfd0002f0f494760d6b&units=metric"
        getData(url: url)
        view.addSubview(w_view)
    }
    
    func getData(url: String){
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }

            //we have data
            var result: Response?

            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("error catching")
            }

            guard let json = result else{
                return
            }

            print(json.main.temp)
            
            DispatchQueue.main.sync {
                self.w_view.tempLabel.text = String(Int(round(Double(json.main.temp)))) + "°C"
                self.w_view.tempLabel.font = self.w_view.tempLabel.font.withSize(35)
                self.w_view.tempLabel.textColor = UIColor.black
                self.w_view.tempLabel.textAlignment = .center
            }


            }).resume()
            
    }
}

struct Response: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}
