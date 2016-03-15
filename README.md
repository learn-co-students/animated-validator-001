

animated-validator
==================

## Goal
There are 5 textfields simulating a user sign up page. Your goal is to

- "validate" each field, meaning check for the appropriate input.
- if the input is invalid, make the user aware with an eye-catching animation
- once all fields are valid, enable the submit button.

## Instructions

  1. The fields (listed below) have already been added to your Storyboard. The submit button will be disabled by default thanks to a line at the end of `viewDidLoad`.
  3. Validate your different fields using the criteria listed below. If someone "leaves" the field with an invalid value, make the field flash red and pulse (quickly grow bigger/smaller).
   - There are two ways to be notified when the user exits a text field: the UITextFieldDelegate method `textFieldDidEndEditing`, or you can wire up an IBAction from the field and select the "Editing Did End" event. Think about which approach works best for you. 
  4. As soon as all fields are valid, make the submit button animate in from the bottom. 
      - To be notified when the text inside a textfield changes, wire up an action to the field's "Editing Changed" event (*not* "Value Changed", confusingly).
      - if you're a UITextFieldDelegate fan, there is only `textField:shouldChangeCharactersInRange:replacementString:`. Be aware though, this method is more complicated than just "editing changed"!
  5. Set up AutoLayout so the form looks good on all phones in portrait. Don't worry about horizontal for now, that will be extra credit.

### The Fields (all are required)

  1. Email
    * Should be a valid email (don't go nuts with this -- a check for an '@' and a period is probably enough)
  2. Email confirm
    * should be the same as the first email field
  3. Phone
    * at least 7 characters
    * only digits
  5. Password
    * at least 6 characters
  6. Password Confirm
    * should be the same as the first password field

## Extra Credit
Notice how, when horizontal, our form is partially covered by the keyboard?

  1. Have the active text view move up when the keyboard is shown, if needed. 

  - *Hint:* If you aren't familiar with `NSNotificationCenter` just yet, this may call for a Cocoapod!

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/animated-validator' title='animated-validator'>animated-validator</a> on Learn.co and start learning to code for free.</p>
