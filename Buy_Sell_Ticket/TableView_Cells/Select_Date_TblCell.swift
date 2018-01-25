//
//  Select_Date_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Select_Date_TblCell: UITableViewCell {
    
    //MARK: -Variables
    var variables = My_Post_Variables()
    var prev_Button = UIButton()
    
    //MARK: -Outlets
    @IBOutlet weak var date_CollectionView: UICollectionView!
    
    //MARK: View Method
    override func awakeFromNib() {
        super.awakeFromNib()
        date_CollectionView.delegate = self
        date_CollectionView.dataSource = self
    }
}

extension Select_Date_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.select_Date.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "select_Date_Cell", for: indexPath) as! Select_Date_Cell
        collectionCell.select_Date.setTitle(variables.select_Date[indexPath.row], for: .normal)
        collectionCell.select_Date.layer.borderColor = UIColor.white.cgColor
        collectionCell.select_Date.layer.borderWidth = 2
        collectionCell.select_Date.tag = indexPath.row
        collectionCell.select_Date.addTarget(self, action: #selector(Select_Date_TblCell.date_Select(_:)), for: .touchUpInside)
        return collectionCell
    }
    
    //MARK: -Click Action
    @objc func date_Select(_ sender: UIButton){
        let button = sender
        if prev_Button.isSelected == true{
            prev_Button.backgroundColor = UIColor.uicolorFromHex(0x262D35, alpha: 100)
            prev_Button.setTitleColor(UIColor.white, for: .normal)
            prev_Button.isSelected = false
        }
        if button.isSelected == true {
            button.backgroundColor = UIColor.uicolorFromHex(0x262D35, alpha: 100)
            button.setTitleColor(UIColor.white, for: .normal)
            button.isSelected = false
        }
        else {
            button.backgroundColor = UIColor.uicolorFromHex(0xF3CD70, alpha: 100)
            button.setTitleColor(UIColor.white, for: .normal)
            button.isSelected = true
        }
        let prev_button = sender
        prev_Button = prev_button
    }
}

