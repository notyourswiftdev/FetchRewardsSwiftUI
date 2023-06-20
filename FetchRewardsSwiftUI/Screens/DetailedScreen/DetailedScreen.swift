//
//  DetailedScreen.swift
//  FetchRewardsSwiftUI
//
//  Created by Aaron Cleveland on 6/19/23.
//

import SwiftUI

struct DetailedScreen: View {
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(meal.strMeal)
                .font(.title)
                .padding()
            Text(meal.idMeal)
                .font(.body)
                .padding()
        }
        .navigationTitle("IDOWANDA")
    }
}

struct DetailedScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailedScreen(meal: Meal(strMeal: "", strMealThumb: "", idMeal: ""))
    }
}
