//
//  DateChooserViewController.swift
//  Display Keyboard on Tap Example
//
//  Created by Stephen Groom on 29/07/2016.
//  Copyright © 2016 Stephen Groom. All rights reserved.
//

import UIKit

class DateChooserViewController: UIViewController {
    @IBOutlet weak var control: FirstResponderControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        control.addTarget(control, action: #selector(becomeFirstResponder), for: .touchUpInside)
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.addTarget(self, action: #selector(datePickerDidChangeValue), for: .valueChanged)
        
        control.inputView = datePicker
        label.text = datePicker.date.description
    }
    
    func datePickerDidChangeValue(sender: UIDatePicker) {
        label.text = sender.date.description
    }
}
