//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Michał Ganiebny on 11/10/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State private var isDetailViewShowing = false
    @State var selectedTab = 0
    
    
    
    
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy", size: 24))
            
                .padding(.top, 20)
                .padding(.leading)
            GeometryReader { geo in
                TabView(selection: $selectedTab) {
                    ForEach (0..<featuredRecipes.count, id: \.self) { index in
                        //Recipe card button
                        Button {
                            self.isDetailViewShowing = true
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 15))
                                }
                            }
                        }
                        .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-30, height: geo.size.height-100)
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Prep Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(featuredRecipes[selectedTab].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlightsView(highlights: featuredRecipes[selectedTab].highlights)
            }.padding(.leading)
        }
        .sheet(isPresented: $isDetailViewShowing) {
            RecipeDetailView(recipe: featuredRecipes[selectedTab])
        }
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
