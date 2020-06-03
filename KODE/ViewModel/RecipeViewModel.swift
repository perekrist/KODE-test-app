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
    
    private var timer: Timer?
    private var url = "https://test.kode-t.ru/recipes.json"
    
    @Published var recipes = [RecipeModel]()
    @Published var newRecipes = [RecipeModel]()
    
    @Published var query = "" {
        didSet {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
                if self.query != "" {
                    self.newRecipes.removeAll()
                    for recipe in self.recipes {
                        if recipe.name.contains(self.query) ||
                            recipe.description.contains(self.query) ||
                            recipe.instructions.contains(self.query) {
                            self.newRecipes.append(recipe)
                        }
                    }
                } else {
                    self.newRecipes = self.recipes
                }
            })
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
                                         instructions: self.regex(text: i.1["instructions"].stringValue),
                                         difficulty: i.1["difficulty"].intValue)
                
                self.recipes.append(recipe)
                id += 1
            }
            self.newRecipes = self.recipes
        }
        
    }
    
    private func regex(text: String) -> String {
        if text.contains("<br>") {
            return text.replacingOccurrences(of: "<br>", with: "\n", options: .literal, range: nil)
        }
        return text
    }
}

