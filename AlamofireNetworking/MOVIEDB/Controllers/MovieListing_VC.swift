//
//  MovieListing_VC.swift
//  AlamofireNetworking
//
//  Created by Team Baasha on 25/06/18.
//  Copyright © 2018 Team Vis. All rights reserved.
//

import UIKit

class MovieListing_VC: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    var count = 1
    
    let movieManagementService = MovieDbManagmentService()
    
    
    var movieResultArray:[MovieResults] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.global(qos: .userInteractive).async {
             self.fetchMovie(page : 1)
        }
        
       

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func fetchMovie(page: Int){
        movieManagementService.getHomeEntities(appID: 0, page: page) { (isSuccess, apiResponse, error) in
            
            if isSuccess
            {
                guard let movieObj = apiResponse as? MovieBase else{return}
                DispatchQueue.main.async {
                     self.movieResultArray = self.movieResultArray + movieObj.results!
                }
               
                
                for item in self.movieResultArray {
                    print("\(item.title!)   \(Domain.BASE_URL_MOVIEDB_IMG+item.poster_path!)")
                }
            }else{
                
            }
        }
    }
    

   
}


extension MovieListing_VC: UICollectionViewDataSource {
    
    
    /// required
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieResultArray.count
    }
    
    /// required
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieListingCell", for: indexPath) as? MovieListingCell else { return UICollectionViewCell() }
        
        guard let title =   self.movieResultArray[indexPath.row].title else {return cell }
        guard let imageUrl  =   self.movieResultArray[indexPath.row].poster_path else {return cell}
        
        let url = Domain.BASE_URL_MOVIEDB_IMG+imageUrl
        cell.setView(movieImgURl: url, title: title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movieResultArray.count - 1 {
            count = count+1
            fetchMovie(page :  count)
            
        }
    }
    
    
    
}

extension MovieListing_VC: UICollectionViewDelegate {
    
}
