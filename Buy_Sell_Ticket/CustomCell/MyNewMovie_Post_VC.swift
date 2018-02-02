//
//  MyNewMovie_Post_VC.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 31/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class MyNewMovie_Post_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: enum
    enum EnumSection{
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
    }
    //MARK: -Variables
    var global_Variables = My_Post_Variables()
    var sectionEnum : EnumSection?
    var theater_Selected : Bool = false
    
    //MARK: -Outlets
    @IBOutlet weak var theaters: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var theater_TableView: UITableView!
    
    //MARK: view Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "SearchTbl_Xib_Cell", bundle: nil), forCellReuseIdentifier: "SearchTbl_Xib_Cell")
        tableView.register(UINib(nibName: "Text_Field_Cells", bundle: nil), forCellReuseIdentifier: "Text_Field_Cells")
        tableView.register(UINib.init(nibName: "MovieImg_cell", bundle: nil), forCellReuseIdentifier: "MovieImg_cell")
        tableView.register(UINib.init(nibName: "Buttons_Xib_Cells", bundle: nil), forCellReuseIdentifier: "Buttons_Xib_Cells")
        tableView.register(UINib.init(nibName: "PostTicket_TblCell", bundle: nil), forCellReuseIdentifier: "PostTicket_TblCell")
        tableView.tableFooterView = UIView()
        self.hideKeyboardWhenTapped()
        //Hide theater view
        theaters.isHidden = true
    }
    
    //MARK: -Tableview datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        if theater_Selected == true{
            return 11
        }
        else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTbl_Xib_Cell", for: indexPath) as! SearchTbl_Xib_Cell
            cell.search_Theater_bar.isTranslucent = true
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieImg_cell", for: indexPath)  as! MovieImg_cell
            cell.showMovie_CollectionView.tag = indexPath.section
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buttons_Xib_Cells", for: indexPath)  as! Buttons_Xib_Cells
            cell.reUseble_CollectionView.tag = indexPath.section
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buttons_Xib_Cells", for: indexPath)  as! Buttons_Xib_Cells
            cell.reUseble_CollectionView.tag = indexPath.section
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buttons_Xib_Cells", for: indexPath)  as! Buttons_Xib_Cells
            cell.reUseble_CollectionView.tag = indexPath.section
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Text_Field_Cells", for: indexPath)  as! Text_Field_Cells
            cell.reUsable_Textfields.tag = indexPath.section
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Text_Field_Cells", for: indexPath)  as! Text_Field_Cells
            cell.reUsable_Textfields.backgroundColor = UIColor.white
            cell.reUsable_Textfields.tag = indexPath.section
            //cell.reUsable_Textfields.addTarget(self, action: #selector(showDatePicker(sender:)), for: .editingDidBegin)
            
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buttons_Xib_Cells", for: indexPath)  as! Buttons_Xib_Cells
            cell.reUseble_CollectionView.tag = indexPath.section
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Buttons_Xib_Cells", for: indexPath)  as! Buttons_Xib_Cells
            cell.reUseble_CollectionView.tag = indexPath.section
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Text_Field_Cells", for: indexPath)  as! Text_Field_Cells
            cell.reUsable_Textfields.backgroundColor = UIColor.uicolorFromHex(0x262D35, alpha: 100)
            cell.reUsable_Textfields.layer.borderWidth = 2
            cell.reUsable_Textfields.layer.borderColor = UIColor.white.cgColor
            cell.reUsable_Textfields.tag = indexPath.section
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTicket_TblCell", for: indexPath)  as! PostTicket_TblCell
            return cell
    }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section){
        case 0: return 70
            
        case 1: return 195
            
        case 2: return 95
            
        case 3: return 70
            
        case 4: return 68
            
        case 5: return 52
            
        case 6: return 52
            
        case 7: return 75
            
        case 8: return 67
            
        case 9: return 52
            
        default: return 70
            
            
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch (section) {
        case 0:
            return "Select Theater"
        case 1:
            return "Select Movie"
        case 2:
            return "Select Date"
        case 3:
            return "No of Ticket"
        case 4:
            return "Ticket Class"
        case 5:
            return "Which row the Tickets have been Booked?"
        case 6:
            return "Show Time"
        case 7:
            return "Booked Method"
        case 8:
            return "Mode of re-payment"
        case 9:
            return "Cost per Ticket"
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = SearchTbl_Xib_Cell()
        if cell.search_Theater_bar.isTranslucent == true{
         global_Variables.search_Button_Clicked = true
        self.searchViewLoad()
        tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.uicolorFromHex(0x262D35, alpha: 100)
        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.textColor = UIColor.white
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    //MARK: -Hide keyboard when endEditing
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }

    //MARK: searching View Load
    func searchViewLoad(){
        if global_Variables.search_Button_Clicked == true{
            theaters.isHidden = false
            theater_TableView.delegate = self
            theater_TableView.dataSource = self
            theater_Selected = true
        }
        else{
            theaters.isHidden = true
        }
    }

}
