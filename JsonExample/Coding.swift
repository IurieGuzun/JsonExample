//
//  Coding.swift
//  JsonExample
//
//  Created by Iurie Guzun on 2021-04-22.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

struct Coord: Codable
{
    var x: Int
    var y: Int
    var i: Int
}
struct Picture: Codable {
    var name: String
    var coordinates: [Coord]
}
