//
//  DessertView.swift
//  FetchRewardsSwiftUI
//
//  Created by Aaron Cleveland on 6/19/23.
//

import SwiftUI

struct DessertView: View {
    @State private var dessertArray: [Meal] = []
    
    var body: some View {
        NavigationView {
            List(dessertArray) { meal in
                VStack(alignment: .leading) {
                    NavigationLink(destination: DetailedScreen(meal: meal)) {
                        Text(meal.strMeal)
                    }
                }
            }.onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        NetworkManager.shared.getDessert { dessert, error in
            if let error = error {
                print(error)
            } else if let dessert = dessert {
                DispatchQueue.main.async {
                    self.dessertArray = dessert.meals
                }
            }
        }
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView()
    }
}
