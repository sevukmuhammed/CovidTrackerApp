//
//  ViewController.swift
//  Covid
//
//  Created by user on 4/22/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var covidListViewModel : CovidListViewModel!
    private var totalCovidListViewModel : TotalCovidListViewModel!
    private var covidViewModel : CovidViewModel!
    var countryArr : [String] = []
    var searchCountry = [String]()
    var data : [CountriesData] = []
    var searching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.HideKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
/*
         Pod kurulumu,carthage, alamofire, 
         */
    }

    func getData() {
        let headers = [
          "content-type": "application/json",
          "authorization": "apikey 78VQBHZMAw0g9CJq57YtWC:0K87DGIh988JpjmGHauKV8"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/corona/countriesData")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        WebService().downLoadResult(request: request) { (covids) in
            if let covids = covids {
                self.covidListViewModel = CovidListViewModel(resultList: covids.result)
                DispatchQueue.main.async {
                    for index in self.covidListViewModel.resultList {
                        self.countryArr.append(index.country)
                        self.data.append(index)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCountry.count
        }
        else
        {
            return self.covidListViewModel == nil ? 0 : self.covidListViewModel.numberOfRowsInSection()
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesDataCell", for: indexPath) as! CountriesDataTableViewCell
        let covidViewModel = self.covidListViewModel.covidAtIndex(indexPath.row)
        if searching {
            cell.countryLabel.text = searchCountry[indexPath.row]
            for index in data {
                if index.country == searchCountry[indexPath.row] {
                    cell.casesLabel.text = index.totalCases
                    cell.activeLabel.text = index.activeCases
                    cell.recoveredLabel.text = index.totalRecovered
                    cell.deathsLabel.text = index.totalDeaths == "" ? "0" : index.totalDeaths
                    cell.newCasesLabel.text = index.newCases
                    cell.newDeathsLabel.text = index.newDeaths
                
                }
            }
            
        } else {
            cell.countryLabel.text = covidViewModel.country
            cell.casesLabel.text = covidViewModel.totalCases
            cell.activeLabel.text = covidViewModel.activeCases
            cell.recoveredLabel.text = covidViewModel.totalRecovered
            cell.deathsLabel.text = covidViewModel.totalDeaths == "" ? "0" : covidViewModel.totalDeaths
            cell.newCasesLabel.text = covidViewModel.newCases
            cell.newDeathsLabel.text = covidViewModel.newDeaths
        }
        
        
        cell.backgroundColor = UIColor(red: 100/255, green: 150/255, blue: 170/255, alpha: 1.0)
        return cell
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = countryArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        dismissKeyboard()
        tableView.reloadData()
    }
}
extension UIViewController {
    func HideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
