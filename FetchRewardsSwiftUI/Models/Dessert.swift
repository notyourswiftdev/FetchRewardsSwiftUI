//
//  Dessert.swift
//  FetchRewardsSwiftUI
//
//  Created by Aaron Cleveland on 6/19/23.
//

import Foundation

// MARK: - Dessert
struct Dessert: Codable {
    let meals: [Meal]

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

// MARK: - Meal
struct Meal: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    // Identifiable protocol requirement
    var id: String { return idMeal }

    enum CodingKeys: String, CodingKey {
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
        case idMeal = "idMeal"
    }
}

