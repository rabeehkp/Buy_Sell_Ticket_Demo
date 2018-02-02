//
//  Text_Field_Cells.swift
//  Buy_Sell_Ticket
//
//  Created by Rabeeh KP on 29/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Text_Field_Cells: UITableViewCell , UITextFieldDelegate {
    
    //MARK: -Variables
    var picker = UIDatePicker()
    //MARK: -Outlets
    @IBOutlet weak var reUsable_Textfields: UITextField!
    
    //MARK: -ViewMethods
    override func awakeFromNib() {
        super.awakeFromNib()
        reUsable_Textfields.delegate = self
        if reUsable_Textfields.tag == 5{
            reUsable_Textfields.text = "Enter row name here"
            reUsable_Textfields.textColor = UIColor.lightGray
            reUsable_Textfields.layer.cornerRadius = 5
        }
        else if reUsable_Textfields.tag == 6{
            reUsable_Textfields.text = "Pick ShowTime"
            reUsable_Textfields.textColor = UIColor.lightGray
            reUsable_Textfields.layer.cornerRadius = 5
        }
        else{
            reUsable_Textfields.text  = "Price will be listed here"
            reUsable_Textfields.textColor = UIColor.lightGray
            reUsable_Textfields.layer.cornerRadius = 5
        }
        // picker.frame = CGRect(x: 0, y: 0, width: frame.width, height: 75)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.textColor == UIColor.lightGray {
            textField.text = nil
            textField.textColor = UIColor.black
        }
        if reUsable_Textfields.tag == 6{
            reUsable_Textfields.inputView = picker
            picker.addTarget(self, action: #selector(datePickerValueChanged(datePicker:)), for: .valueChanged)
            picker.datePickerMode = .time
            reUsable_Textfields.text = "\(picker.date.formatted)"
        }
    }
    //MARK: -ShowDatepicker In textfield when endEditing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if reUsable_Textfields.tag == 6{
            reUsable_Textfields.text = "\(picker.date.formatted)"
        }
    }
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
        reUsable_Textfields.text = "\(picker.date.formatted)"
    }
}
extension Date{
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return  formatter.string(from: self)
    }
}
