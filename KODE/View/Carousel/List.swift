//
//  List.swift
//  KODE
//
//  Created by Кристина Перегудова on 02.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCarousel: View {
    
    @Binding var page: Int
    @Binding var recipe: RecipeModel
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(recipe.images, id: \.self) {i in
                WebImage(url: URL(string: i))
            }
        }
    }
}
