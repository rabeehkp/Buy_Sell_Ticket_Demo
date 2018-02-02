//
//  ButtonsXIB_Cell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 25/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit
struct Movie_date{
    let cell : Int!
    let date : String!
}

class ButtonsXIB_Cell: UITableViewCell {
    
    //MARK: -Variables
    var variables = My_Post_Variables()
    var date = [Movie_date]()
    @IBOutlet weak var reusable_CollectionCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        date = [ Movie_date(cell : 1, date: "jan 1"),Movie_date(cell : 2, date: "jan 2"),Movie_date(cell : 3, date: "jan 3"),Movie_date(cell : 4, date: "jan 4"),Movie_date(cell : 5, date: "jan 5"),Movie_date(cell : 6, date: "jan 6"),Movie_date(cell : 7, date: "jan 7")]
       reusable_CollectionCell.delegate = self
        reusable_CollectionCell.dataSource = self
        reusable_CollectionCell.register(UINib(nibName: "Button_Collection_Cell", bundle: nil), forCellWithReuseIdentifier: "Button_Collection_Cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ButtonsXIB_Cell: UICollectionViewDelegate , UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return date.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if date[indexPath.row].cell == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
        cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
       else if date[indexPath.row].cell == 2 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
            cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
        else if date[indexPath.row].cell == 3 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
            cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
        else if date[indexPath.row].cell == 4 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
        cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
        else if date[indexPath.row].cell == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
            cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
        else if date[indexPath.row].cell == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
            cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }

        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button_Collection_Cell", for: indexPath) as! Button_Collection_Cell
            cell.reusable_Button.setTitle(date[indexPath.row].date, for: .normal)
            return cell
        }
    }
}
