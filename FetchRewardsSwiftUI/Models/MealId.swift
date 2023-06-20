//
//  MealId.swift
//  FetchRewardsSwiftUI
//
//  Created by Aaron Cleveland on 6/19/23.
//

import Foundation

// MARK: - MealID
struct MealID: Codable, Equatable {
    let meals: [[String: String?]]

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}
