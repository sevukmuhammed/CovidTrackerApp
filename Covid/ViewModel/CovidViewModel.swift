//
//  CovidViewModel.swift
//  Covid
//
//  Created by user on 4/22/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

struct CovidListViewModel {
    let resultList : [CountriesData]
}
extension CovidListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.resultList.count
    }
    func covidAtIndex(_ index: Int) -> CovidViewModel {
        let covid = self.resultList[index]
        return CovidViewModel(result: covid)
    }
}
struct CovidViewModel {
    let result : CountriesData
    var country : String {
        return self.result.country
    }
    var totalCases : String {
        return self.result.totalCases
    }
    var newCases : String {
        return self.result.newCases
    }
    var totalDeaths : String {
        return self.result.totalDeaths
    }
    var newDeaths : String {
        return self.result.newDeaths
    }
    var totalRecovered : String {
        return self.result.totalRecovered
    }
    var activeCases : String {
        return self.result.activeCases
    }
}
