import UIKit

class FocusableTextField: UITextField {
    var previousBorderColor: CGColor!
    override func becomeFirstResponder() -> Bool {
        self.previousBorderColor = self.layer.borderColor!
        self.layer.borderColor = UIColor(red: 0.259, green: 0.522, blue: 0.957, alpha: 1.0).CGColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        self.layer.borderColor = self.previousBorderColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        return super.resignFirstResponder()
    }
}