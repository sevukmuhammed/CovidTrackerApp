//
//  TotalCovid.swift
//  Covid
//
//  Created by user on 4/23/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

struct TotalResponse: Decodable {
    let success: Bool
    let result: TotalData
}
struct TotalData: Decodable {
    let totalDeaths: String
    let totalCases: String
    let totalRecovered: String
}
