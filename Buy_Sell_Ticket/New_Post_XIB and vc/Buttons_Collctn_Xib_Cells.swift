//
//  Buttons_Collctn_Xib_Cells.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 29/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Buttons_Collctn_Xib_Cells: UICollectionViewCell {

    //MARK: - Variables
    @IBOutlet weak var reUsable_Buttons: UIButton!
    
    //MARK: - View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        reUsable_Buttons.layer.cornerRadius = 5
    }
}
