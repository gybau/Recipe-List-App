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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        // Get a single serving size by multiplying the denominator by the recipeServings
        if ingredient.num != nil {
            
            
            denominator *= recipeServings
            
            // Get target portion by multiplying the numerator by targetServings
            
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            
            if numerator >= denominator {
                
                // Calculate whole portions
                wholePortions = numerator/denominator
                // Calculate remainder and assign it to numerator
                numerator = numerator % denominator
                //Assign to portion string
                portion += String(wholePortions)
            }
            // If there is a fraction left add it to the portion string
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
