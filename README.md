---
tags: auotlayout, uianimation, uitextfield
languages:objc
---

animated-validator
==================

## Instructions

  1. The fields below have been added to your Storyboard. The submit button should be disabled by default and hidden.
  3. Validate your different fields. If someone tries to leave the field before
     they put in a valid item, pulse the field red and bigger/smaller.
  4. As soon as all valid items are entered, have the submit button animate in from the bottom.
  5. AutoLayout this...it should work in all phones.
  6. Don't worry too much about the fact that in horizontal the bottom may be covered by the keyboard.

### The Fields (all are required)

  1. Email
    * Should be a valid email
  2. Email confirm
    * should be the same as Email
  3. Phone
    * only digits or a `+`
    * at least 7 digits
  5. Password
    * at least 6 characters
  6. Password Confirm
    * should be the same as Password

## Extra Credit

  1. Get the uitextfield to scroll up when the keyboard is shown if needed...check out cocoapods!
