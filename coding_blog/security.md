# Online Security
> Steps to secure your online accounts

Context: hackers have more powerful algorithms and launch attacks on larger scales, so everyone is at risk.

Changing all your passwords on a cycle such as yearly also decreases your risk - any password can be cracked with enough time to try combinations, so regular changes are good for preventing this.

Increasing a password's length increases the difficulty of guessing a password a lot more than adding special characters or numbers does. 16 characters is the required length at my company for laptop passwords. Spaces are allowed and only alpha characters are sufficient. This is a passphrase - typically 3 or 4 words which are random or form a sentence.

Some websites support two-factor authentication. This means that you need both the password (entered on desktop or mobile) and your actual mobile device (for a one time pin) in order to login in. Use this for your most important or sensitive accounts where 2FA is supported, to protect them even if your password is stolen/guessed. Such as for your password manager, Twitter, Gmail, Github and AWS.

## Steps

1. Download the Google Authenticator app for your phone.
    - Android and iOS links [here](https://support.google.com/accounts/answer/1066447) with instructions. 
    - Using the SMS method to get a security is sufficient, but using a security app can be more convenient and more secure. There is no waiting time like there is for an SMS, which may not be secure and also the SMS code does not have the same 60-second expiry.
1. Setup LastPass
    1. Register an account on [LastPass.com](https://www.lastpass.com/) with your e-mail and a password (ideally at least 16 characters).
    1. Setup your LastPass account with 2FA (Google Authenticator or SMS).
    1.  Install the [browser extension](https://lastpass.com/misc_download2.php).
    1. Install the mobile app (see _mobile_ tab for above link or search your app store).
1. Clear your browser passwords
    1. Open your browser.
    1. Open preferences. 
    1. Under _Passwords_, delete all your saved site passwords from your browser.
    1. Repeat for all your browsers.

## Reasons to use LastPass

LastPass is built as a central credentials storage location and it does this great.

You don't have to manage credentials across Chrome, Firefox and whatever other documents you use. 

You can force LastPass to require a password after a period of inactivity or reopening the browser.

It works on desktop and mobile. 

## Why use LastPass instead of a browser for managing passwords

- There is a risk in someone accessing your passwords if your browser is left open.
- There is no browser master password by default.
- Your passwords could be synced so someone signed into Chrome/Firefox as you on another machine could get your passwords. 
- LastPass has a more elegant way of adding/updating/viewing/searching your site logins
- LastPass allows storing of text notes, for extra details around a site.

## Resources

Read about Google 2-step authentication to protect your Google account https://www.google.com/landing/2step/
