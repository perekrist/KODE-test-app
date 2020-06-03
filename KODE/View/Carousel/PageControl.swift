//
//  PageControl.swift
//  KODE
//
//  Created by Кристина Перегудова on 02.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    
    @Binding var page: Int
    var recipe: RecipeModel
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .white
        view.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
        view.numberOfPages = recipe.images.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

