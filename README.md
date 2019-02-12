# AdjustableForKeyboard

Add this protocol to your ViewController and call addObserversForKeyboard(), you'll also need to add a bottomConstraint to your XIB/Storyboard/Code. example:

```
class AwesomeViewController : UIViewController, AdjustableForKeyboard
{
   @IBOutlet var bottomConstraint:NSLayoutConstraint!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      addKeyboardObservers()
   }
...
```
