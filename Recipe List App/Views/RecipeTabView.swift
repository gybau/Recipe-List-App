//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Michał Ganiebny on 11/10/2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured View Placeholder")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
