## papers-please-shortcuts-mod

### Table of Contents
1. [What it is](#what-it-is)
2. [How it works](#how-it-works)
   1. [Shortcuts](#shortcuts)
3. [How to install](#how-to-install)
4. [Troubleshooting](#troubleshooting)
5. [Support](#support)
   1. [Donations](#donations)

### What it is

This mod adds several shortcuts to the game "Papers Please".

Unfortunately the source code isn't available and there isn't a modding API available, therefore I had to make due with an AHK script and abide by its limitations.

### How it works

There are several shortcuts to make many of the actions in the game a lot more streamlined and less tedious.

#### List of shortcuts

- a: Approve - approves the currently hovered over document
- d: Deny - denies the currently hovered over document
- w: Interrogate - clicks on the speaker to interrogate the current person and returns the mouse to its original position
- space: ToggleInspect - toggles inspect mode regardless of whether the corresponding upgrade has been purchased yet
- tab: ToggleStamp - toggles the stamp, works before and after the corresponding upgrade has been purchased
- q: CallNext - calls in the next person
- e: HandToPerson - hands the currently hovered over document to the person currently worked on
- ctrl+s: MoveToDesk - moves the currently hovered over document to the center of the desk
- s: MoveToTray - moves the currently hovered document to the tray at the bottom left
- t: ToggleShutterAndReturn - toggles the shutter and returns the mouse to its original position

- y: Reason - denies and provides reason to the currently hovered over document
- x: Detain - detains the current individual
- ctrl+x: AdvancedDetain - detains the current individual and calls in the next person afterwards (provided they don't have special dialogue)
- c: Search - starts the search (to check for contraband or assure gender etc.)
- v: Fingerprint - takes the fingerprint from the current person
- ctrl+v: AdvancedFingerprint - takes the fingerprint from the current person and automatically compares it to the printout

- shift-escape: Suspend - toggles the mod on or off, incase you want to type something while keeping the mod active
- ctrl-escape: ExitApp - quits the mod

Feel free to edit the shortcuts and scripts to your liking if you know what you're doing.

### How to install

All you need is a working installation of AHK (Auto Hotkey) and my script provided under the releases section.

If you haven't installed AHK yet, procede to the [official site](https://www.autohotkey.com/) and follow the instructions there.

Afterwards, simply run the mentioned script and you're good to go.

### Troubleshooting

The mod works with locations on the screen instead of directly interacting with the objects in the game. Therefore, if you're using this on a monitor with a different resolution some shortcuts might not work.
All positions adapt to different resolutions, but depending on how the game treats the rescaling process some positions may be slightly off. In that case, feel free to modify the positions at the top of the file, if at all they should be only slightly off and only small adjustments should be needed to get everything working again.

If you're playing on a monitor with 1920x1080 resolution everything should work perfectly regardless.

### Support

If you enjoyed this, feel free to check out my other quality-of-life tools, all free and open-source as well, no ads and no nonsense.

- _ShutDownEr_: https://github.com/JohnStephens1/ShutDownEr
- _Timerrhymer_: https://github.com/JohnStephens1/Timerrhymer
- _4Focus_: https://github.com/JohnStephens1/4Focus

and more on my profile.

#### Donations

If you found any of them useful, sharing my work with people who might profit from it would be highly appreciated.

Alternatively, any and every donation would mean a lot and help me stay open-source and free.

https://www.paypal.com/donate/?hosted_button_id=L4X2DFAYMJ72U