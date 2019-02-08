import Foundation
import UIKit

protocol AdjustableForKeyboard {
    var bottomConstraint:NSLayoutConstraint! { get set }
    var offset: CGFloat { get set }
    func keyboardWillShow(notification: NSNotification)
    func keyboardWillHide(notification: NSNotification)
}

extension AdjustableForKeyboard where Self: UIViewController {
    
    var offset: CGFloat {
        return 0
    }
    
    func addObserversForKeyboard() {
       _ = NotificationCenter.default
            .addObserver(forName: NSNotification.Name.UIKeyboardWillShow,object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillShow(notification: notification as NSNotification)}
        
        _ = NotificationCenter.default
            .addObserver(forName: NSNotification.Name.UIKeyboardWillHide,object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillHide(notification: notification as NSNotification)}
    }
    
    func removeObserversForKeyboard() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        guard let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.bottomConstraint.constant = -(keyboardFrame.size.height + 8)
        self.view.layoutIfNeeded()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.bottomConstraint.constant = -self.offset
        self.view.layoutIfNeeded()
    }
}
