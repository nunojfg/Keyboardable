# Keyboardable

Add this protocol to your ViewController and call addObserversForKeyboard(), you'll also need to add a bottomConstraint to your XIB/Storyboard/Code. example:

```
class AwesomeViewController : UIViewController, Keyboardable
{
   @IBOutlet var bottomConstraint:NSLayoutConstraint!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      addKeyboardObservers()
   }
...
```

Roadmap:

1. Add example project
2. Add cocoapods integration
...
