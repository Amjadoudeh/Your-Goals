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
///     1- the nextButton is not moving with Keyboard and the keyborad is not showing at all :) and the app craches when I try to write or put the focus on textField.
///     2- replacement of UITableViewRowAction because it was deprecated in iOS 13.0: Use UIContextualAction and related APIs instead.
///     3- fix the Cell UI and test the app by adding / deleting goals and increase the progress and see the changes.
