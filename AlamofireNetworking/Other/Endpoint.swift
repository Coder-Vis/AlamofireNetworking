//
//  Endpoint.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 24/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation


protocol Endpoint {
    var base: String { get }
    var path: String { get }
}
extension Endpoint {
    var apiKey: String {
        return "api_key=adc074a18043184e9ae32e48852f5023"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}




