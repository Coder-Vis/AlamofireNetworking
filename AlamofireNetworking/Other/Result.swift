//
//  Result.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 24/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation


enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
