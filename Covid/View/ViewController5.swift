//
//  ViewController5.swift
//  Covid
//
//  Created by user on 4/24/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    var continentName = ""
    
    @IBOutlet weak var continentImage: UIImageView!
    @IBOutlet weak var textImage1: UIImageView!
    @IBOutlet weak var textImage3: UIImageView!
    @IBOutlet weak var textImage2: UIImageView!
    @IBOutlet weak var totalCaseText: UILabel!
    @IBOutlet weak var totalRecoveryText: UILabel!
    @IBOutlet weak var totalDeathsText: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textImage1.layer.cornerRadius = 8.0
        textImage2.layer.cornerRadius = 8.0
        textImage3.layer.cornerRadius = 8.0
        getData()
        setContinentImage()
        // Do any additional setup after loading the view.
        
    }
    
    func setContinentImage() {
            
            switch continentName {
            case "Asia":
                self.continentImage.image = UIImage(named: "Asia")!
            case "Africa":
                self.continentImage.image = UIImage(named: "Africa")!
            case "Europe":
                self.continentImage.image = UIImage(named: "Europe")!
            case "North America":
                self.continentImage.image = UIImage(named: "NorthAmerica")!
            case "South America":
                self.continentImage.image = UIImage(named: "SouthAmerica")!
            case "Oceania":
                self.continentImage.image = UIImage(named: "Australia")!
            default:
                self.continentImage.image = UIImage(named: "Africa")!
            }
    }
    func getData() {
        let headers = [
          "content-type": "application/json",
          "authorization": "apikey 78VQBHZMAw0g9CJq57YtWC:0K87DGIh988JpjmGHauKV8"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/corona/continentData")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        WebService().downLoadContinentResult(request: request) { (covids) in
            if let covids = covids {
                
                DispatchQueue.main.async {
                    for continents in covids.result {
                        if continents.continent == self.continentName
                        {
                            self.totalCaseText.text = continents.totalCases
                            self.totalRecoveryText.text = continents.totalRecovered
                            self.totalDeathsText.text = continents.totalDeaths
                        }
                        
                    }
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
