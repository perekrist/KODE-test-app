//
//  RecipeView.swift
//  KODE
//
//  Created by Кристина Перегудова on 01.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeView: View {
    
    @Binding var recipe: RecipeModel
    @State var page = 0
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack {
                    Carousel(recipe: self.$recipe, page: self.$page)
                    
                    VStack {
                        Spacer()
                        PageControl(page: self.$page, recipe: self.$recipe)
                            .padding(.vertical, 20)
                    }
                }
                
                Text("\(recipe.name)")
                    .foregroundColor(.blue)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .shadow(radius: 50)
                    .padding()
                
                if recipe.description != "" {
                    Text("\(recipe.description)")
                        .foregroundColor(.gray)
                        .font(.body)
                        .italic()
                        .padding()
                }
                
                HStack {
                    
                    ForEach(0 ..< recipe.difficulty) {_ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                Text("Instruction")
                    .foregroundColor(.blue)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .shadow(radius: 50)
                    .padding()
                
                Text("\(recipe.instructions)")
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding()
                
                Spacer()
            }
        }
    }
}

