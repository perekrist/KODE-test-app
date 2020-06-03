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
    @State private var showSortVariants = false
    @State private var recipe = RecipeModel(id: 0, uuid: "", name: "", images: [], lastUpdated: 0, description: "", instructions: "", difficulty: 0)
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                    TextField("Search...", text: $recipeViewModel.query)
                        .padding()
                        .foregroundColor(.white)
                    if self.recipeViewModel.query != "" {
                        Button(action: {
                            self.recipeViewModel.query = ""
                        }) {
                            Image(systemName: "xmark.square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    
                }.background(Color.black.opacity(0.3))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .shadow(radius: 20)
                
                Button(action: {
                    self.showSortVariants = true
                }) {
                    Image(systemName: "arrow.up.arrow.down.square")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 15)
                }
            }
            
            List {
                ForEach(recipeViewModel.newRecipes) { i in
                    RecipeCardView(recipe: i)
                }
            }
        }
        .actionSheet(isPresented: $showSortVariants) {
            ActionSheet(title: Text("Sort data by..."), buttons: [
                .default(Text("Name up")) {
                    self.recipeViewModel.recipes.sort {
                        $0.name < $1.name
                    }
                    self.recipeViewModel.newRecipes.sort {
                        $0.name < $1.name
                    }
                },
                .default(Text("Name down")) {
                    self.recipeViewModel.recipes.sort {
                        $0.name > $1.name
                    }
                    self.recipeViewModel.newRecipes.sort {
                        $0.name > $1.name
                    }
                },
                .default(Text("Last updated data up")) {
                    self.recipeViewModel.recipes.sort {
                        $0.lastUpdated < $1.lastUpdated
                    }
                    self.recipeViewModel.newRecipes.sort {
                        $0.lastUpdated < $1.lastUpdated
                    }
                },
                .default(Text("Last updated data down")) {
                    self.recipeViewModel.recipes.sort {
                        $0.lastUpdated > $1.lastUpdated
                    }
                    self.recipeViewModel.newRecipes.sort {
                        $0.lastUpdated > $1.lastUpdated
                    }
                },
                .cancel()
            ])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
