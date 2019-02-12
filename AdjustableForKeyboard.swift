
import UIKit

protocol AdjustableForKeyboard: class {
    var bottomConstraint: NSLayoutConstraint! { get set }
    var offset: CGFloat { get set }
    func addKeyboardObservers()
    func removeKeyboardObservers()
}

extension AdjustableForKeyboard where Self: UIViewController {
    
    var offset: CGFloat {
        return 0
    }
    
    func addKeyboardObservers() {
        
        _ = NotificationCenter.default
            .addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillShow(notification: notification)
        }
        
        _ = NotificationCenter.default
            .addObserver(forName: UIResponder.keyboardWillHideNotification,object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillHide(notification: notification)
        }
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: Notification) {
        
        guard
            let info = notification.userInfo,
            let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
        }
        
        self.bottomConstraint.constant = -(keyboardFrame.size.height + self.offset)
        view.layoutIfNeeded()
    }
    
    func keyboardWillHide(notification: Notification) {
        self.bottomConstraint.constant = -self.offset
        view.layoutIfNeeded()
    }
}

