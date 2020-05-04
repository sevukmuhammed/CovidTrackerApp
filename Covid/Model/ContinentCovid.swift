//
//  ContinentCovid.swift
//  Covid
//
//  Created by user on 4/24/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

struct ContinentResponse: Decodable{
    var success: Bool
    var result: [ContinentData]
}
struct ContinentData: Decodable {
    var continent: String
    var totalCases: String
    var newCases: String
    var totalDeaths: String
    var newDeaths: String
    var totalRecovered: String
    var activeCases: String
}

