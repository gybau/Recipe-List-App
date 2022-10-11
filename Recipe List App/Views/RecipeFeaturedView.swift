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
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
                .padding(.leading)
            GeometryReader { geo in
                TabView {
                    ForEach (model.recipes) { r in
                        if r.featured {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(r.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(r.name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width-30, height: geo.size.height-100)
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Prep Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, vegetarian")
            }.padding(.leading)
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
