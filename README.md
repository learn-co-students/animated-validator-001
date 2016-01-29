

animated-validator
==================

## Instructions

  1. The fields below have been added to your Storyboard. The submit button should be disabled by default and hidden.
  3. Validate your different fields. If someone leaves the field without entering a valid value, pulse the field red and bigger/smaller. (*Hint:* to be notified when the user exits a textfield, wire up an action to the field and select the "Editing Did End" event.)
  4. As soon as all fields are valid, have the submit button animate in from the bottom. (*Hint:* to be notified when the value of a textfield changes, wire up an action to the field's "Editing Changed" event (*not* "Value Changed", confusingly).)
  5. Set up Autolayout so the form looks good on all phones.
  6. Don't worry about the fact that in horizontal the bottom may be covered by the keyboard; we'll tackle that later.

### The Fields (all are required)

  1. Email
    * Should be a valid email (don't go nuts with this -- a check for an '@' and a period is probably enough)
  2. Email confirm
    * should be the same as the first email field
  3. Phone
    * only digits or a `+`
    * at least 7 digits
  5. Password
    * at least 6 characters
  6. Password Confirm
    * should be the same as the first password field

## Extra Credit

  1. Have the text views move up when the keyboard is shown, if needed. Check for relevant Cocoapods!

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/animated-validator' title='animated-validator'>animated-validator</a> on Learn.co and start learning to code for free.</p>
