//
//  FirstResponderControl.swift
//  Display Keyboard on Tap Example
//
//  Created by Stephen Groom on 28/07/2016.
//  Copyright © 2016 Stephen Groom. All rights reserved.
//

import UIKit

//The protocol needs to be of type class in order to be stored weakly
protocol FirstResponderControlDelegate: class {
    func firstResponderControl(_ control: FirstResponderControl, didReceiveText text: String)
    func firstResponderControlDidDeleteBackwards(_ control: FirstResponderControl)
    func firstResponderControlHasText(_ control: FirstResponderControl) -> Bool
}

class FirstResponderControl: UIControl, UIKeyInput {
    
    private var _inputView: UIView?
    override var inputView: UIView? {
        get {
            return _inputView
        }
        set {
            _inputView = newValue
        }
    }
    
    weak var delegate: FirstResponderControlDelegate?

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func insertText(_ text: String) {
        self.delegate?.firstResponderControl(self, didReceiveText: text)
    }
    
    func deleteBackward() {
        self.delegate?.firstResponderControlDidDeleteBackwards(self)
    }
    
    func hasText() -> Bool {
        return self.delegate?.firstResponderControlHasText(self) ?? false
    }
}
