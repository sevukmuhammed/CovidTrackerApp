//
//  ViewController2.swift
//  Covid
//
//  Created by user on 4/23/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var textImage2: UIImageView!
    @IBOutlet weak var textImage3: UIImageView!
    
    @IBOutlet weak var totalCasesText: UILabel!
    @IBOutlet weak var totalRecoveredText: UILabel!
    @IBOutlet weak var totalDeathsText: UILabel!
    
    private var totalCovidListViewModel: TotalCovidListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textImage.layer.cornerRadius = 8.0
        textImage2.layer.cornerRadius = 8.0
        textImage3.layer.cornerRadius = 8.0
        getTotalData()
        //getTotalData()
        //textImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    /*
    func getData() {
        
        print(totalCovidListViewModel.gettingResults())
    }
    */
    func getTotalData() {
        let headers = [
            "content-type": "application/json",
            "authorization": "apikey 78VQBHZMAw0g9CJq57YtWC:0K87DGIh988JpjmGHauKV8"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/corona/totalData")! as URL,
                            cachePolicy: .useProtocolCachePolicy,
                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        WebService().downLoadTotalResult(request: request) { (totalcovid) in
            if let totalcovid = totalcovid {
                self.totalCovidListViewModel =  TotalCovidListViewModel(resultList: totalcovid.result)
                DispatchQueue.main.async {
                    self.totalCasesText.text = self.totalCovidListViewModel.resultList.totalCases
                    self.totalRecoveredText.text = self.totalCovidListViewModel.resultList.totalRecovered
                    self.totalDeathsText.text = self.totalCovidListViewModel.resultList.totalDeaths
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
