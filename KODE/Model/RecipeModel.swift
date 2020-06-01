//
//  RecipeModel.swift
//  KODE
//
//  Created by Кристина Перегудова on 01.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct RecipeModel: Identifiable {
    var id: Int
    var uuid: String
    var name: String
    var images: [String]
    var lastUpdated: Int
    var description: String
    var instructions: String
    var difficulty: Int
}
