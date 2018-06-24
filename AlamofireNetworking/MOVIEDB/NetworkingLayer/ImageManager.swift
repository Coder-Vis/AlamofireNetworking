//
//  ImageManager.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 25/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage


class ImageManager {
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: UInt64(100).megabytes(),
        preferredMemoryUsageAfterPurge: UInt64(60).megabytes()
    )
    
    
    
    func retrieveImage(for url: String, completion: @escaping (UIImage) -> Void) -> Request {
        return Alamofire.request(url, method: .get).responseImage { response in
            guard let image = response.result.value else { return }
            DispatchQueue.main.async {
                completion(image)
                self.cache(image, for: url)
            }
           
        }
    }
    
    //MARK: = Image Caching
    
    func cache(_ image: Image, for url: String) {
        imageCache.add(image, withIdentifier: url)
    }
    
    func cachedImage(for url: String) -> Image? {
        return imageCache.image(withIdentifier: url)
    }
    
    
}


extension UInt64 {
    
    func megabytes() -> UInt64 {
        return self * 1024 * 1024
    }
    
}
