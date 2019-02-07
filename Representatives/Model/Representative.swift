//
//  Representative.swift
//  Representatives
//
//  Created by Dominic Lanzillotta on 2/7/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let phone: String
    let office: String
    let link: String
    let district: String
}
