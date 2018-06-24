//
//  MovieResults.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 25/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation

struct MovieResults : Codable {
    let poster_path : String?
    let backdrop_path : String?
    let genre_ids : [Int]?
    let vote_count : Int?
    let overview : String?
    let original_title : String?
    let vote_average : Double?
    let popularity : Double?
    let id : Int?
    let original_language : String?
    let release_date : String?
    let video : Bool?
    let title : String?
    let adult : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case poster_path = "poster_path"
        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case vote_count = "vote_count"
        case overview = "overview"
        case original_title = "original_title"
        case vote_average = "vote_average"
        case popularity = "popularity"
        case id = "id"
        case original_language = "original_language"
        case release_date = "release_date"
        case video = "video"
        case title = "title"
        case adult = "adult"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
    }
    
}

