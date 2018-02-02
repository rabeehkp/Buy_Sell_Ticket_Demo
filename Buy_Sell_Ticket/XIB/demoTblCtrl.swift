//
//  demoTblCtrl.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 25/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit


class demoTblCtrl: UITableViewController {

    var variables = My_Post_Variables()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {      
        let cell = Bundle.main.loadNibNamed("ButtonsXIB_Cell", owner: self, options: nil )?.first as! ButtonsXIB_Cell
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
        
    }
    

}
