//
//  NetworkManager.swift
//  FetchRewardsSwiftUI
//
//  Created by Aaron Cleveland on 6/19/23.
//

import Foundation

// HTTP Request Method
enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

class NetworkManager {
    static let shared = NetworkManager()

    func getDessert(completion: @escaping (Dessert?, Error?) -> ()) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = RequestMethod.get.rawValue
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Data not found"]))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let dessert = try jsonDecoder.decode(Dessert.self, from: data)
                completion(dessert, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func getMealId(mealId: Int, completion: @escaping (MealID?, Error?) -> ()) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + String(mealId))!
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = RequestMethod.get.rawValue
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Data not found"]))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let mealId = try jsonDecoder.decode(MealID.self, from: data)
                completion(mealId, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
