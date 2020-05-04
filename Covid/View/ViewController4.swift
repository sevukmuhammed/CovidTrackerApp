//
//  ViewController4.swift
//  Covid
//
//  Created by user on 4/23/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit
import SafariServices


class ViewController4: UIViewController{
 

    @IBOutlet weak var tableView: UITableView!
    //var url =  "fdgasg"
    
    private var data = [NewsData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        let headers = [
          "content-type": "application/json",
          "authorization": "apikey 78VQBHZMAw0g9CJq57YtWC:0K87DGIh988JpjmGHauKV8"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/corona/coronaNews")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        WebService().downLoadNewsResult(request: request) { (news) in
            if let news = news {
                self.data = news.result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                }
            }
        }
    
    
         
}
extension ViewController4: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else {
            return UITableViewCell() }
        
        cell.newsLabel.text = data[indexPath.row].name
        
        if let imageURL = URL(string: data[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.newsImageView.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = data[indexPath.row].url
        
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = StoryBoard.instantiateViewController(withIdentifier: "ViewController6") as! ViewController6
        vc.url = url.self
        
        self.navigationController?.present(vc, animated: true)
        
        
        /*
        Safari
         ***********

        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true)
        */
        
        
        
    }
 
    
}

   


