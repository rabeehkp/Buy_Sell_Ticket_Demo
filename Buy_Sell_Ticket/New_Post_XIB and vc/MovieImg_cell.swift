//
//  MovieImg_cell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 29/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class MovieImg_cell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: - Variables
    var variables = My_Post_Variables()
    
    //MARK: - Outlets
    @IBOutlet weak var showMovie_CollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showMovie_CollectionView.delegate = self
        showMovie_CollectionView.dataSource = self
        showMovie_CollectionView.register(UINib(nibName: "Movie_Img_Collctn_Cell", bundle: nil), forCellWithReuseIdentifier: "Movie_Img_Collctn_Cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - CollectionView datasource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Movie_Img_Collctn_Cell", for: indexPath) as! Movie_Img_Collctn_Cell
        cell.movieImgView.image = UIImage(named: variables.movies[indexPath.row])
        cell.movieNameLbl.text = variables.movies[indexPath.row]
        cell.movieImgView.layer.frame.size.height = 160
        return cell
    }
}
extension MovieImg_cell: UICollectionViewDelegateFlowLayout{
    fileprivate var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }

    fileprivate var itemsPerRow: CGFloat {
        return 2.6
    }

    fileprivate var interitemSpace: CGFloat {
        return 6.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        let availableHeight = collectionView.bounds.height
        let heightPerItem = availableHeight // itemsPerRow
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
        return 2.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}

