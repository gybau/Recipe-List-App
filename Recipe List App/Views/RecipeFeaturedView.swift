//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Michał Ganiebny on 11/10/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        Text("Hello World")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
