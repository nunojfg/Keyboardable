# SwiftMixins

Simple mixins to aid in Swift development:
AdjustableForKeyboard:
Add this protocol to your ViewController and call addObserversForKeyboard(), you'll also need to add a bottomConstraint to your XIB/Storyboard. example:

class AwesomeViewController : UIViewController, AdjustableForKeyboard
{
...

   override func viewDidLoad()
   {
      super.viewDidLoad()
      addObserversForKeyboard()
...
