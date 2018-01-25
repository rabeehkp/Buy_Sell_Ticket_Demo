//
//  Ticket_Class_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Ticket_Class_TblCell: UITableViewCell {
    
    //MARK: - Variables
    var variables = My_Post_Variables()
    var prev_Button = UIButton()
    
    //MARK: -Outlets
    @IBOutlet weak var ticket_Class_CollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ticket_Class_CollectionView.delegate = self
        ticket_Class_CollectionView.dataSource = self
    }
}

extension Ticket_Class_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: -CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.ticket_Class.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ticket_Class_Cell", for: indexPath) as! Ticket_Class_Cell
        collectionCell.ticket_Class.setTitle(variables.ticket_Class[indexPath.row], for: .normal)
        collectionCell.ticket_Class.layer.borderColor = UIColor.white.cgColor
        collectionCell.ticket_Class.layer.borderWidth = 2
        collectionCell.ticket_Class.addTarget(self, action: #selector(Ticket_Class_TblCell.class_Select(_:)), for: .touchUpInside)
        return collectionCell
    }
    //MARK: -Click Action
    @objc func class_Select(_ sender: UIButton){
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

