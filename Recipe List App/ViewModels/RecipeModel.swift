//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        // Get a single serving size by multiplying the denominator by the recipeServings
        
        // Get target portion by multiplying the numerator by targetServings
        
        // Reduce fraction by greatest common divisor
        
        // Get the whole portion if numerator > denominator
        
        // Express the remainder as a fraction
        
        return String(targetServings)
    }
}
