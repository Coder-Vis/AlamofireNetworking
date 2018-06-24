//
//  Router.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 24/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import Alamofire

public typealias onCloudResponseRecieved = ( _ apiResponse: Bool, _ serverResponse:  Any? , _ Error : Any) -> ()

enum Router :  URLRequestConvertible {
    
    case getRequest(link : String , arg: String)
    case postRequest(link : String ,parameters: Parameters)
    case auth(link: String, parameters: Parameters)
    
    
    static let baseURLString = "https://api.themoviedb.org/"
    
    var method: HTTPMethod {
        switch self {
        case .getRequest:
            return .get
            
        case .postRequest:
            return .post
         
            
        case .auth:
            return .post
            
        }
    }
    
    var urlpath: String {
        switch self {
        case .getRequest(let link , let arg):
            return "\(link+arg)"
            
        case .postRequest(let link , _):
            return "\(link)"
            
        case .auth(let username, _):
            return "/users/\(username)"
            
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try urlpath.asURL()
        
        // var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .postRequest(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .auth(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}
