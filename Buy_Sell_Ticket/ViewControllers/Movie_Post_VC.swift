//
//  Movie_Post_VC.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 23/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Movie_Post_VC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -Variables
    var theater_Selected : Bool = false
    
    //MARK: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    //MARK: TableView Datasource
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
        switch (indexPath.section) {
        case 0:
            let theater_Cell = tableView.dequeueReusableCell(withIdentifier: "select_Theater_Cell", for: indexPath) as! Select_Theater_Cell
            return theater_Cell
        case 1:
            let movie_Cell = tableView.dequeueReusableCell(withIdentifier: "select_Movie_TblCell", for: indexPath) as! Select_Movie_TblCell
            return movie_Cell
        case 2:
            let date_Cell = tableView.dequeueReusableCell(withIdentifier: "select_Date_TblCell", for: indexPath) as! Select_Date_TblCell
            return date_Cell
        case 3:
            let tickets_Cell = tableView.dequeueReusableCell(withIdentifier: "no_of_Ticket_TblCell", for: indexPath) as! No_of_Ticket_TblCell
            return tickets_Cell
        case 4:
            let ticket_Class = tableView.dequeueReusableCell(withIdentifier: "ticket_Class_TblCell", for: indexPath) as! Ticket_Class_TblCell
            return ticket_Class
        case 5:
            let ticket_Row_Cell = tableView.dequeueReusableCell(withIdentifier: "ticket_Row_TblCell", for: indexPath) as! Ticket_Row_TblCell
            ticket_Row_Cell.enter_Row_Txt.frame.size.height = 50
            ticket_Row_Cell.enter_Row_Txt.borderStyle = .roundedRect
            return ticket_Row_Cell
        case 6:
            let show_Time_Cell = tableView.dequeueReusableCell(withIdentifier: "show_Time_TblCell", for: indexPath) as! Show_Time_TblCell
            return show_Time_Cell
        case 7:
            let booked_Cell = tableView.dequeueReusableCell(withIdentifier: "booked_Method_TblCell", for: indexPath) as! Booked_Method_TblCell
            return booked_Cell
        case 8:
            let payment_Cell = tableView.dequeueReusableCell(withIdentifier: "payment_TblCell", for: indexPath) as! Payment_TblCell
            return payment_Cell
        case 9:
            let cost_Cell = tableView.dequeueReusableCell(withIdentifier: "cost_of_Ticket_TblCell", for: indexPath) as! Cost_of_Ticket_TblCell
            return cost_Cell
        case 10:
            let post_Cell = tableView.dequeueReusableCell(withIdentifier: "post_TblCell", for: indexPath) as! Post_TblCell
            return post_Cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    //Section Header Title
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
    //MARK: -ColectionView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        theater_Selected = true
        tableView.reloadData()
    }
    
    //Creating Section Header View
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
    
    //Height of Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 82
        case 1:
            return 208
        case 2:
            return 96
        case 3:
            return 71
        case 4:
            return 68
        case 5:
            return 52
        case 6:
            return 52
        case 7:
            return 75
        case 8:
            return 67
        case 9:
            return 51
        case 10:
            return 70
        default:
            return 0
        }
    }
    
    //MARK: - Navigation Action
    @IBAction func back(_ sender: UIBarButtonItem) {
       
    }
}
