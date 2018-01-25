//
//  Booked_Method_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Booked_Method_TblCell: UITableViewCell {

    //MARK: -Variables
    var variables = My_Post_Variables()
    var prev_Button = UIButton()
    
    //MARK: -Outlets
    @IBOutlet weak var booked_Method_CollectionView: UICollectionView!
    
  
    //MARK: -View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        booked_Method_CollectionView.dataSource = self
        booked_Method_CollectionView.delegate = self
    }
}

extension Booked_Method_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
   
    //MARK: -CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.booking_Method.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "booked_Method_Cell", for: indexPath) as! Booked_Method_Cell
        collectionCell.booked_Method.setTitle(variables.booking_Method[indexPath.row], for: .normal)
        collectionCell.booked_Method.layer.borderColor = UIColor.white.cgColor
        collectionCell.booked_Method.layer.borderWidth = 2
        collectionCell.booked_Method.addTarget(self, action: #selector(Booked_Method_TblCell.booked_Method(_:)), for: .touchUpInside)
        return collectionCell
    }
    
    //MARK: -Click Action
    @objc func booked_Method(_ sender: UIButton){
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

