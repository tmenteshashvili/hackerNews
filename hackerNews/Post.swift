//
//  Post.swift
//  hackerNews
//
//  Created by Tako Menteshashvili on 15.07.22.
//

import Foundation

struct Post: Identifiable, Decodable {
    
    var id: String {
        
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
  
}


struct Results: Decodable {
    
    let hits: [Post]
}
