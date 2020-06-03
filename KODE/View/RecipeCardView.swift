//
//  RecipeCardView.swift
//  KODE
//
//  Created by Кристина Перегудова on 01.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeCardView: View {
    
    var recipe: RecipeModel
    @State private var show = false
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: recipe.images[0]))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220, alignment: .top)
            
            HStack {
                Spacer()
                VStack {
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
                            .lineLimit(2)
                            .padding()
                    } else {
                        Text("<-- No description -->")
                            .foregroundColor(.gray)
                            .font(.body)
                            .italic()
                            .lineLimit(2)
                            .padding()
                    }
                    
                    Spacer()
                    
                }
                Spacer()
            }
            .background(Color("cardbg"))
            .frame(height: 180, alignment: .bottom)
            
        }.cornerRadius(20)
            .onTapGesture {
                self.show.toggle()
        }
        .sheet(isPresented: self.$show) {
            RecipeView(recipe: self.recipe)
        }
    }
}
