# Pre-work - TipCalc

TipCalc is a tip calculator application for iOS.

Submitted by: Holly Ham

<<<<<<< HEAD
Time spent: **20** hours spent in total
=======
Time spent: **X** hours spent in total
>>>>>>> 55a546f1041583121b0c4da54ea3b632ee4e74f0

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
<<<<<<< HEAD
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
=======
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
>>>>>>> 55a546f1041583121b0c4da54ea3b632ee4e74f0
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

*[x] User input is automatically aligned right, and currency symbol is used as a placeholder
<<<<<<< HEAD
*[x] Created custom app icon and splash screen
*[x] Hidding the keyboard reveals the total cost (or the tip, depending on the user's selection) divided by two, three, and four people
*[x] Default selector in the selection page for total cost or tip to be divided 
=======
*[x]Created custom app icon and splash screen
>>>>>>> 55a546f1041583121b0c4da54ea3b632ee4e74f0

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<<<<<<< HEAD
<img src='https://imgur.com/mAAeQQn' title='Video Walkthrough' width='' alt='Video Walkthrough' />
=======
<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
>>>>>>> 55a546f1041583121b0c4da54ea3b632ee4e74f0

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Although this is the first time I've created an iOS app, my experience in object oriented programming made basic concepts easier to learn Swift.

I completed part of the Settings page without using the directions on the prework website because I did not realize a tutorial was provided. This caused my initial implementation to be flawed as I did not correctly connect the settings view controller to the TipCalc view controller.

Creating an IU that is easy to use forced me to make some difficult decisions. For example, if a user goes into the Setting page and does not change the default tip percentage, the percentage being used in the main view controller will match the default setting. This is to show the user that the settings are taking effect. The other option would be to match the tip percentage with the default setting only if the default setting has just been changed. However, thiis may confuse the useer as it may be unclear whether their setting preferance was saved.

## License

Copyright 2017 Holly Ham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
