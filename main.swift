extension AdjustableForKeyboard where Self: UIViewController
{
    func addObserversForKeyboard()
    {
        NSNotificationCenter.defaultCenter()
            .addObserverForName(UIKeyboardWillShowNotification,object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillShow(notification)}
        
        NSNotificationCenter.defaultCenter()
            .addObserverForName(UIKeyboardWillHideNotification,object: nil,queue: nil) { [weak self] notification in
                self?.keyboardWillHide(notification)}
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
            
        self.bottomConstraint.constant = keyboardFrame.size.height
        self.view.layoutIfNeeded()
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        self.bottomConstraint.constant = 0
        self.view.layoutIfNeeded()
    }
}

protocol AdjustableForKeyboard
{
    var bottomConstraint:NSLayoutConstraint! { get set }
    func keyboardWillShow(notification: NSNotification)
    func keyboardWillHide(notification: NSNotification)
}
