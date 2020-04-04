//
//  GlobalCount.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import Foundation
// MARK: - GlobalCount
struct GlobalCount: Codable {
    let count: Int?
    let date: String?
    let result: Result?
}

// MARK: - Result
struct Result: Codable {
    let confirmed, deaths, recovered: Int
}
