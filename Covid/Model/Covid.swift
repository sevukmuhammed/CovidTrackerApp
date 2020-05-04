//
//  Api.swift
//  Covid
//
//  Created by user on 4/22/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

struct CountryResponse: Decodable {
    let success: Bool
    let result: [CountriesData]
}
struct CountriesData: Decodable {
    let country: String
    let totalCases: String
    let newCases: String
    let totalDeaths: String
    let newDeaths: String
    let totalRecovered: String
    let activeCases: String
}

