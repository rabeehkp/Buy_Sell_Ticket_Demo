//
//  Buttons_Xib_Cells.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 29/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

enum CollectionTag : Int {
    typealias RawValue = Int

    case two = 2
    case three = 3
    case four = 4
    case seven = 7
    case eight = 8
}


class Buttons_Xib_Cells: UITableViewCell,   UICollectionViewDelegate,  UICollectionViewDataSource {

    //MARK: - Variables
    var variables = My_Post_Variables()
    var enums : CollectionTag?
    var prev_Button = UIButton()
    //MARK: - Outlets
    @IBOutlet weak var reUseble_CollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reUseble_CollectionView.delegate = self
        reUseble_CollectionView.dataSource = self
        reUseble_CollectionView.register(UINib.init(nibName: "Buttons_Collctn_Xib_Cells", bundle: nil), forCellWithReuseIdentifier: "Buttons_Collctn_Xib_Cells")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reUseble_CollectionView.tag == 2{
            return variables.select_Date.count
        }
        else if reUseble_CollectionView.tag == 3{
            return variables.no_of_Tickets.count
        }
        else if reUseble_CollectionView.tag == 4{
            return variables.ticket_Class.count
        }
        else if reUseble_CollectionView.tag == 7{
          return variables.booking_Method.count
        }
        else if reUseble_CollectionView.tag == 8{
            return variables.payment.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (reUseble_CollectionView.tag) {
        case 2:
            let buttonTitle = variables.select_Date
            return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        case 3:
            let buttonTitle = variables.no_of_Tickets
            return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        case 4:
            let buttonTitle = variables.ticket_Class
        return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        case 7: let buttonTitle = variables.booking_Method
        return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        case 9: let buttonTitle = variables.payment
        return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        default:
            let buttonTitle = variables.payment
            return self.collectionCell(buttonTitle: buttonTitle, indexPath: indexPath, collectionView: collectionView)
        }
    }
    func collectionCell(buttonTitle : [String], indexPath: IndexPath, collectionView: UICollectionView )-> Buttons_Collctn_Xib_Cells {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Buttons_Collctn_Xib_Cells", for: indexPath) as! Buttons_Collctn_Xib_Cells
        cell.reUsable_Buttons.setTitle(buttonTitle[indexPath.row], for: .normal)
        cell.reUsable_Buttons.layer.borderColor = UIColor.white.cgColor
        cell.reUsable_Buttons.layer.borderWidth = 2
         cell.reUsable_Buttons.addTarget(self, action: #selector(Buttons_Xib_Cells.date_Select(_:)), for: .touchUpInside)
        return cell
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
extension Buttons_Xib_Cells: UICollectionViewDelegateFlowLayout{
    
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
        if collectionView.tag == 2{
            return CGSize(width: 90, height: 80 )
        }
        else if collectionView.tag == 3{
             return CGSize(width: 60, height: 50)
        }
        else{
            return CGSize(width: 150, height: 40)
        }
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

