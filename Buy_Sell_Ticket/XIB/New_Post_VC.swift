//
//  New_Post_VC.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 25/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class New_Post_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "nameOfYourNibFile", bundle: nil)
        
       // tableView.register(nib, forCellReuseIdentifier: "buttonsXIB_Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonsXIB_Cell", for: indexPath) as! ButtonsXIB_Cell
    
        return cell
    }

}
