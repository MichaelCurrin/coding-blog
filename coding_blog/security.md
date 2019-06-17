# Online Security
> Steps to secure your online accounts

Context: hackers have more powerful algorithms and launch attacks on larger scales, so everyone is at risk.

## About Passwords

Changing all your passwords on a cycle such as yearly also decreases your risk - any password can be cracked with enough time to try combinations, so regular changes are good for preventing this.

Increasing a password's length increases the difficulty of guessing a password a lot more than adding special characters or numbers does. 16 characters is the required length at my company for laptop passwords. Spaces are allowed and only alpha characters are sufficient. This is a passphrase - typically 3 or 4 words which are random or form a sentence.

## About Two-step sign-in

Some websites support two-factor authentication. This means that you need both the password (entered on desktop or mobile) and your actual mobile device (for a one time pin) in order to login in. Use this for your most important or sensitive accounts where 2FA is supported, to protect them even if your password is stolen/guessed. Such as for your password manager, Twitter, Gmail, Github and AWS.

## Setup 

Below are the steps I suggest to completely replace your password storage approach with LassPass and two setup two-factor authentication for Google, LastPass and any other sites you wish to.

1. Download the Google Authenticator app for your phone. Do this now or as part of the next step.
    - Android and iOS links [here](https://support.google.com/accounts/answer/1066447) with instructions. 
    - Using the SMS method to get a security is sufficient, but using a security app can be more convenient and more secure. There is no waiting time like there is for an SMS, which may not be secure and also the SMS code does not have the same 60-second expiry.
1. Folow the steps here to setup [Google 2-step authentication](https://www.google.com/landing/2step/), to protect your Google account. You will be guided to setting up Google Authenticator app, starting with your Gmail account address under a _Google_ item.
1. Setup LastPass on your devices.
    1. Register an account on [LastPass.com](https://www.lastpass.com/) with your e-mail and a password (ideally at least 16 characters).
    1. Setup your LastPass account with 2FA (Google Authenticator or SMS).
    1. Install the [browser extension](https://lastpass.com/misc_download2.php).
    1. Install the mobile app (see _mobile_ tab for above link or search your app store).
1. Clear your desktop browser's passwords.
    1. Open your browser.
    1. Open preferences.
    1. Open _Passwords_ section.
    1. Site by site, transfer the details to LastPass. You can do this by clicking the add button in LastPass, but see steps below to get LastPass to import for you you:
        1. Visit a site where you have an account.
        1. Login, using your browser's credentials autofill if you like.
        1. LastPass will recognized credentials when you sign in (or register). When prompted by the LastPass extension, click Add site.
    1. In browser Password section, delete all your saved site passwords from your browser, provided you have moved them across completely.
    1. Repeat for all your browsers.
    
### Backup security codes

Make sure you have a way to login to Google and LastPass without your device, in case you have an issue with 2FA (such as your device is lost or not with you).

Go into your account and under the security section, get the backup codes. There will be about fixed 10 codes which can be used once (you can also generate a new set in case they are compromised). For site like Google and Github, can save your codes as a long text note in LastPass. Though of course there is the danger that if someone is in your LastPass account without your device, they can get into other accounts even easier.

An alternative is to print out the backup codes and keep them somewhere secure at home or work or at a friend.

Printing codes is needed for LastPass as the codes will be inaccessible without the codes or a device.

## Reasons to use LastPass

- LastPass is built as a central credentials storage location and it does this great. You don't have to manage credentials across Chrome, Firefox and whatever other documents you use. 
- You can force LastPass to require a password after a period of inactivity or reopening the browser.
- LastPass has a more elegant way of adding/updating/viewing/searching your site logins.
- LastPass allows storing of text notes, for extra details around a site.
- It works on desktop and mobile. 

## Reasons to not use a browser's own password storage

- There is a risk in someone accessing your passwords if your browser is left open.
- There is no master password setup default.
- Your passwords could be synced, so someone signed into Chrome/Firefox as you on another machine could get your passwords. 
