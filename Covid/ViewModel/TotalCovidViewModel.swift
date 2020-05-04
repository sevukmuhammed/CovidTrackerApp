//
//  TotalCovidViewModel.swift
//  Covid
//
//  Created by user on 4/23/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation
struct TotalCovidListViewModel {
    let resultList: TotalData
}
extension TotalCovidListViewModel {
    func gettingResults() -> TotalCovidViewModel {
        let totalCovid = self.resultList
        return TotalCovidViewModel(result: totalCovid)
    }
}
struct TotalCovidViewModel {
    let result: TotalData
    var totalDeaths: String {
        return self.result.totalDeaths
    }
    var totalCases: String {
        return self.result.totalCases
    }
    var totalRecovered: String {
        return self.result.totalRecovered
    }
}
