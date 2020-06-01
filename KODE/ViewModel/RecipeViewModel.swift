//
//  RecipeViewModel.swift
//  KODE
//
//  Created by Кристина Перегудова on 01.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RecipeViewModel: ObservableObject {
    private var url = "https://test.kode-t.ru/recipes.json"
    
    @Published var recipes = [RecipeModel]()
    @Published var newRecipes = [RecipeModel]()
    
    @Published var query = "" {
           didSet {
               newRecipes.removeAll()
               for recipe in recipes {
                   if recipe.name.contains(query) ||
                    recipe.description.contains(query) ||
                    recipe.instructions.contains(query) {
                       newRecipes.append(recipe)
                   }
               }
           }
       }

    init() {
        getRecipes()
    }
    
    private func getRecipes() {
        
        AF.request(url).responseJSON { (data) in
            let json = try! JSON(data.data)
            
            let recipes = json["recipes"]
            
            var id = 0
            for i in recipes {
                let recipe = RecipeModel(id: id,
                                    uuid: i.1["uuid"].stringValue,
                                    name: i.1["name"].stringValue,
                                    images: i.1["images"].arrayObject as! [String],
                                    lastUpdated: i.1["lastUpdated"].intValue,
                                    description: i.1["description"].stringValue,
                                    instructions: i.1["instructions"].stringValue,
                                    difficulty: i.1["difficulty"].intValue)
                    
                self.recipes.append(recipe)
                id += 1
            }
            
        }
        
    }
}

