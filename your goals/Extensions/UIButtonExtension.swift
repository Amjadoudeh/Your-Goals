import UIKit

extension UIButton {

    func setSelectedColor() {
        self.backgroundColor = UIColor.red
        // UIColor.init(red: 109, green: 188, blue: 99, alpha: 0)
        // UIColor(red: 109, green: 188, blue: 99, alpha: 1)
    }

    func setDeselectedColor() {
        self.backgroundColor = UIColor.blue
        // UIColor.init(red: 178, green: 221, blue: 175, alpha: 0)
        // UIColor(red: 178, green: 221, blue: 175, alpha: 1)
    }
}

/// List of the Bugs:
///     1- the UIbutton are not changing the background colors when it's being clicked.
///     2- the nextButton is not moving with Keyboard and the keyborad is not showing at all :)
///     3- the app craches when I try to write or put the focus on textField.
