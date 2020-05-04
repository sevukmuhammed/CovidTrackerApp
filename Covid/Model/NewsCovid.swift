//
//  NewsCovid.swift
//  Covid
//
//  Created by user on 4/24/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    let success: Bool
    let result: [NewsData]
}
struct NewsData: Decodable {
    let url: String
    let image: String
    let name: String
}
