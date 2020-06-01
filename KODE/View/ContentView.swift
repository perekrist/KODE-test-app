//
//  ContentView.swift
//  KODE
//
//  Created by Кристина Перегудова on 01.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        
        List(recipeViewModel.recipes) { i in
            RecipeCardView(recipe: i)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
