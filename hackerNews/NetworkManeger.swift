//
//  NetworkManeger.swift
//  hackerNews
//
//  Created by Tako Menteshashvili on 15.07.22.
//

import Foundation

class NetworkManeger: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() async throws {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {fatalError("Mssing URL")}
        let urlRequest = URLRequest(url: url)
        let(data, respons) = try await URLSession.shared.data(for: urlRequest)
        
        
        guard (respons as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
        let results = try JSONDecoder().decode(Results.self, from: data)
        DispatchQueue.main.async {
            self.posts = results.hits
        }
       
        
        
    }
    
    
}
