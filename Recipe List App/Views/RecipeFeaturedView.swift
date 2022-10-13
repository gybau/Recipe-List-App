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
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
                .padding(.leading)
            GeometryReader { geo in
                TabView(selection: $selectedTab) {
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured {
                            
                            //Recipe card button
                            Button {
                                self.isDetailViewShowing = true
                                
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }.tag(index)
                                .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[selectedTab])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-30, height: geo.size.height-100)
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Prep Time:")
                    .font(.headline)
                Text(model.recipes[selectedTab].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlightsView(highlights: model.recipes[selectedTab].highlights)
            }.padding(.leading)
        }
        .onAppear {
            setFeaturedIndex()
        }
    }
    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured == true
        }
        selectedTab = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
