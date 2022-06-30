import UIKit

extension UIButton {

    func setSelectedColor() {
        self.backgroundColor = UIColor(red: 109/255, green: 188/255, blue: 99/255, alpha: 1)
    }

    func setDeselectedColor() {
        self.backgroundColor = UIColor(red: 178/255, green: 221/255, blue: 175/255, alpha: 1)
    }
}

/// List of the Bugs:
///     1- the UIbutton are not changing the background colors when it's being clicked.
///     2- the nextButton is not moving with Keyboard and the keyborad is not showing at all :)
///     3- the app craches when I try to write or put the focus on textField.
