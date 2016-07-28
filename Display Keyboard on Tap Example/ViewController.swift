//
//  ViewController.swift
//  Display Keyboard on Tap Example
//
//  Created by Stephen Groom on 28/07/2016.
//  Copyright © 2016 Stephen Groom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FirstResponderControlDelegate {

    @IBOutlet weak var control: FirstResponderControl!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        control.addTarget(control, action: #selector(becomeFirstResponder), for: .touchUpInside)
        control.delegate = self
    }
    
    func firstResponderControlHasText(_ control: FirstResponderControl) -> Bool {
        if let isEmpty = label.text?.isEmpty {
            return isEmpty
        }
        return false
    }
    
    func firstResponderControlDidDeleteBackwards(_ control: FirstResponderControl) {
        if let text = label.text, !text.isEmpty{
            label.text = text.substring(to: text.index(before: text.endIndex))
        }
    }
    
    func firstResponderControl(_ control: FirstResponderControl, didReceiveText text: String) {
        label.text?.append(text)
    }
}
