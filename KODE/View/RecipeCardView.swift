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
                    
                    Text("\(recipe.description)")
                        .foregroundColor(.gray)
                        .font(.body)
                        .italic()
                        .lineLimit(2)
                        .padding()
                    
                    //                    Text("\(recipe.lastUpdated)")
                    //                        .foregroundColor(.red)
                    //                        .font(.body)
                    //                        .padding()
                    
                    Spacer()
                    
                }
                Spacer()
            }.background(Color.white)
                .frame(height: 180, alignment: .bottom)
            
        }.cornerRadius(20)
            //            .shadow(radius: 20)
            .onTapGesture {
                self.show.toggle()
        }
        //        .sheet(isPresented: self.$show) {
        //            RecipeView(recipe: self.recipe)
        //        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: RecipeModel(id: 0, uuid: "", name: "English Toffee with Dark Chocolate and Almond", images: [], lastUpdated: 1481712330, description: "Try this English Toffee with Dark Chocolate and Almond recipe, or contribute your own.", instructions: "Prepare a large baking sheet lined with parchment paper. In a deep, heavy-bottomed pan, heat the butter, sugar and salt over medium heat. Stir frequently until the butter is melted and the ingredients combine. Slowly bring the mixture to a boil. Let it simmer over medium heat. Stir occasionally with a wooden spatula until the color of the mixture changes to amber. Around 20 minutes. Remove toffee from heat, carefully spread it evenly over the baking sheet with a spatula. Sprinkle the chocolate chips over the hot toffee and allow to set for a few minutes to soften. Gently spread the chocolate to thinly coat the top of the toffee. Sprinkle the almonds over the chocolate layer. Use a sheet of clean parchment paper to gently pat the almonds into the chocolate. Place the toffee into the refrigerator for at least an hour to harden. Once chilled, carefully remove the toffee from the pan by lifting the hangs of the parchment paper, and break into pieces.", difficulty: 1))
            .previewLayout(.sizeThatFits)
    }
}
