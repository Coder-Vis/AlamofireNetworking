//
//  MovieBase.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 25/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation

struct MovieBase : Codable {
   
    let total_pages : Int?
    let page : Int?
    let results : [MovieResults]?
    let total_results : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case total_pages = "total_pages"
        case page = "page"
        case results = "results"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([MovieResults].self, forKey: .results)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
    }
    
}

