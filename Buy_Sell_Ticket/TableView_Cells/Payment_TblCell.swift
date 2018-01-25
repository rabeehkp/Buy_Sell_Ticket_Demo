//
//  Payment_TblCell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Payment_TblCell: UITableViewCell {
    
    //MARK: -Variables
    var variables = My_Post_Variables()
    var prev_Button = UIButton()
    
    //MARK: -Outlets
    @IBOutlet weak var payment_CollectionView: UICollectionView!
    
    //MARK: -View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        payment_CollectionView.delegate = self
        payment_CollectionView.dataSource = self
    }
}

extension Payment_TblCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: -CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variables.payment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "payment_Cell", for: indexPath) as! Payment_Cell
        collectionCell.payment_Method.setTitle(variables.payment[indexPath.row], for: .normal)
        collectionCell.payment_Method.layer.borderColor = UIColor.white.cgColor
        collectionCell.payment_Method.layer.borderWidth = 2
        collectionCell.payment_Method.addTarget(self, action: #selector(payment_Select(_:)), for: .touchUpInside)
        return collectionCell
    }
    
    //MARK: -Click Action
    @objc func payment_Select(_ sender: UIButton){
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

