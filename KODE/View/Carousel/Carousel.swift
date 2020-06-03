//
//  Carousel.swift
//  KODE
//
//  Created by Кристина Перегудова on 02.06.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct Carousel: UIViewRepresentable {
    
    var recipe: RecipeModel
    @Binding var page: Int
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let total = UIScreen.main.bounds.width * CGFloat(recipe.images.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: ListCarousel(recipe: self.recipe))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: 400)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate {
        
        var parent: Carousel
        
        init(parent1: Carousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.parent.page = page
        }
    }
}
