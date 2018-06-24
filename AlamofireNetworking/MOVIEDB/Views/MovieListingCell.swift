//
//  MovieListingCell.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 25/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import UIKit
 
//movieListingCell
class MovieListingCell: UICollectionViewCell {
    let imageManager = ImageManager()
    @IBOutlet weak var loadingIndicator : UIActivityIndicatorView!
    
    @IBOutlet weak var movieThumbImg : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!
   
    func setView(movieImgURl : String , title : String){
        titleLbl.text = title
        loadImage(imgUrl: movieImgURl)
    }
    
    override func prepareForReuse() {
        titleLbl.text = nil
        movieThumbImg.image = nil
    }

    
    
    func loadImage(imgUrl : String) {
        loadingIndicator.startAnimating()
        if let image = imageManager.cachedImage(for: imgUrl) {
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
                 self.movieThumbImg.image = image
            }
            
            return
        }
        DispatchQueue.global(qos: .userInteractive).async {
            self.downloadImage(imgUrl: imgUrl)
        }
        
    }
    
    func downloadImage(imgUrl : String) {
        _ = imageManager.retrieveImage(for: imgUrl) { image in
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                 self.loadingIndicator.isHidden = true
                self.movieThumbImg.image = image
            }
        }
        
    }
 

   
}
