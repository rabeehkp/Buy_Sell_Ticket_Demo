//
//  My_PostVC.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 22/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class My_PostVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: -Variables
    var movies = My_Post_Variables()
    
    //MARK: -Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: -View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: -CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myMovie_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "my_Post_Cell", for: indexPath) as! My_Post_collectionCell
        myMovie_Cell.Movie_ImageView.image = UIImage(named: movies.movies[indexPath.row])
        myMovie_Cell.movie_Name.text = movies.movies[indexPath.row]
        return myMovie_Cell
    }
}

//MARK: -Custom layout
extension My_PostVC: UICollectionViewDelegateFlowLayout{
    fileprivate var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }

    fileprivate var itemsPerRow: CGFloat {
        return 2
    }

    fileprivate var interitemSpace: CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        let availableHeight = collectionView.bounds.height
        let heightPerItem = availableHeight / itemsPerRow
        return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}


