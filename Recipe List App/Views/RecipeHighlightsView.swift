//
//  RecipeHighlightsView.swift
//  Recipe List App
//
//  Created by Michał Ganiebny on 13/10/2022.
//

import SwiftUI



struct RecipeHighlightsView: View {
    
    var allHighlights = ""

    init(highlights:[String]) {
        for index in 0..<highlights.count {
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["test1", "test2", "test3"])
    }
}
