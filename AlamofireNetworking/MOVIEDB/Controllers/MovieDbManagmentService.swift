//
//  MovieDbManagmentService.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 24/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class MovieDbManagmentService:NSObject
{
    public func getHomeEntities(appID:Int,page : Int , onCloudResponseRecieved: @escaping onCloudResponseRecieved)
    {
        
        let req =   Router.getRequest(link: Domain.BASE_URL_MOVIEDB+Path.MOVIE_LIST, arg: "api_key=\(ApiKey.MOVIEDB_KEY)&language=en-US&page=\(page)")
        
     
        
        Alamofire.request(req)
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if response.data != nil {
                        do{
                            if let result = response.result.value {
                               //print(JSON(response.result.value))
                                let movieBase = try JSONDecoder().decode(MovieBase.self, from: response.data!)
                            onCloudResponseRecieved(true, movieBase , "")
                            }
                        }catch{
                            onCloudResponseRecieved(false, nil, "Exception While decoding " )
                        }
                    }
                    
                case .failure(let error):
                    onCloudResponseRecieved(false, nil, error )
                }
                
        }
        
        
     }
    
}

