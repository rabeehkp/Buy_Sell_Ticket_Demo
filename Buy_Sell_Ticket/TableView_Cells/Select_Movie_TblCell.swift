//
//  Select_Movie_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Select_Movie_TblCell: UITableViewCell {
    
    //MARK: -Variables
    var movies = My_Post_Variables()
    
    //MARK: -Outlets
    @IBOutlet weak var movie_CollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movie_CollectionView.delegate = self
        movie_CollectionView.dataSource = self
    }
}

extension Select_Movie_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - CollectionView Delegate and DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "select_Movie_Cell", for: indexPath) as! Select_Movie_Cell
        collectionCell.movie_ImageView.image = UIImage(named: movies.movies[indexPath.row])
        collectionCell.movie_Names.text = movies.movies[indexPath.row]
        return collectionCell
    }  
}
