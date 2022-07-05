// import UIKit
//// this extension to modify the way that ViewControllers are presented and to emulate
// extension UIViewController {
//
//    func presentDetail(_ viewControllerToPresent: UIViewController) {
//        let transtion = CATransition()
//        transtion.duration = 0.3
//        transtion.type = CATransitionType.push
//        transtion.subtype = CATransitionSubtype.fromRight
//        self.view.window?.layer.add(transtion, forKey: kCATransition)
//
//        present(viewControllerToPresent, animated: false, completion: nil)
//    }
//
//    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
//        let transtion = CATransition()
//        transtion.duration = 0.3
//        transtion.type = CATransitionType.push
//        transtion.subtype = CATransitionSubtype.fromRight
//        self.view.window?.layer.add(transtion, forKey: kCATransition)
//
//        guard let presentedViewController = presentedViewController else { return }
//
//        presentedViewController.dismiss(animated: false) {
//            self.view.window?.layer.add(transtion, forKey: kCATransition)
//            self.present(viewControllerToPresent, animated: false, completion: nil)
//        }
//    }
//
//    func dismissDetail() {
//        let transtion = CATransition()
//        transtion.duration = 0.3
//        transtion.type = CATransitionType.push
//        transtion.subtype = CATransitionSubtype.fromLeft
//        self.view.window?.layer.add(transtion, forKey: kCATransition)
//        dismiss(animated: false, completion: nil)
//    }
//
// }
