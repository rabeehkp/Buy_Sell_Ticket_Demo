//
//  No_of_Ticket_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class No_of_Ticket_TblCell: UITableViewCell {
    
    //MARK: -Variables
    var variables = My_Post_Variables()
    var prev_Button = UIButton()
    
    //MARK: -Outlets
    @IBOutlet weak var no_of_Ticket_CollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        no_of_Ticket_CollectionView.dataSource = self
        no_of_Ticket_CollectionView.delegate = self
    }
}

//MARK: -CollectionView DataSource
extension No_of_Ticket_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.no_of_Tickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "no_of_Ticket_Cell", for: indexPath) as! No_of_Ticket_Cell
        collectionCell.no_of_Tickets.setTitle(variables.no_of_Tickets[indexPath.row], for: .normal)
        collectionCell.no_of_Tickets.layer.borderColor = UIColor.white.cgColor
        collectionCell.no_of_Tickets.layer.borderWidth = 2
        collectionCell.no_of_Tickets.addTarget(self, action: #selector(No_of_Ticket_TblCell.no_Select(_:)), for: .touchUpInside)
        return collectionCell
    }
    
    //MARK: -Click Action
    @objc func no_Select(_ sender: UIButton){
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

