//
//  SearchTbl_Xib_Cell.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 29/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class SearchTbl_Xib_Cell: UITableViewCell, UISearchBarDelegate {
   
    var globalVariables = My_Post_Variables()
    var clicked : Bool!
    
    @IBOutlet weak var search_Theater_bar: UISearchBar!
    
    @IBOutlet weak var demoView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         globalVariables.search_Button_Clicked = true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        clicked = true
        globalVariables.search_Button_Clicked = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        clicked = false
        globalVariables.search_Button_Clicked = false
    }
    
}
