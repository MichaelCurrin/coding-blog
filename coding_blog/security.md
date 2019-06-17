# Online Security
> How to understand modern online security and how to improve your security

For context, hackers have more powerful algorithms and launch attacks on larger scales, so everyone is at risk. And most password cracking is automated and systematic, rather than a human guessing passwords.

This article covers the following:
- [Passwords](#passwords)
- [Password managers](#password-managers)
- [Two-factor Authentication](#two-factor-authentication)
- [Get Secured](#get-secured)
    * [How to setup 2FA](#how-to-setup-2fa)
    * [How to setup LastPass](#how-to-setup-lastpass)
    * [2FA backup codes](#2fa-backup-codes)
    

## Passwords

Changing all your passwords on a cycle such as yearly also decreases your risk - any password can be cracked with enough time to try combinations, so regular changes are good for preventing this.

Choose a password which is long (but easy to remember) rather than one which uses a large character set (but it difficult to type and remember).

This article on [The Eternal Password Riddle](https://www.secjuice.com/eternal-password-riddle/) covers information entropy (or randomness) as way of measuring strength. It shows that a password made up of 12 characters picked from a set of 26 (the lowercase alphabet) is stronger than an 8-character password which has 41 characters including special characters. The shorter one has two thirds the length and one and half times the size yet it weaker. The article also explains brute-force attacks and how to generate a strong password.

### Passphrases

Use a passphrase for password you have to type and remember easily (and perhaps don't want even want to store anywhere). Such as your laptop or LastPass password.

A passphrase is typically 3 or 4 words which are either random or form a sentence (preferably only one which makes sense to you). You can also come up with an image or a story which helps you relate your random words together, or keep generating random words until you find a list that works. 

This site will generate a passphrase for you as it explains how various password styles are - [Use A Passphrase](https://www.useapassphrase.com/).

e.g.

- `across region guard takes`
    * Length: 4 words, 25 characters
    * Approximate Crack Time: 15,936 centuries
- `reversal netview drilling plot`
    * Length: 4 words, 30 characters
    * Approximate Crack Time: 6,136,851,976 centuries

Though, the advice I read is usually to generate a passphrase using a die and a downloaded list of possible words, rather than a site which generates passphrases for you. As a die is truly random and uncontrollable, compared with a password-generating site.

At my work, which is serious about security, changed to setup a system where 16 characters is the required length for laptop passwords Spaces are allowed and all lowercase letters is sufficient.

### More complex passwords

I use about 24 characters for most sites where I set a password. Sites often require at least one capital letter, number and special character - you could add these somewhere in your passwords such as the beginniner or end. Or if, you only ever will copy and paste or autofill your password, you can let LastPass generate a 24-character password for you which uses a set of over 60 characters.


## Password managers

Using a password manager is a convenient way to securely store usernames and passwords for all the sites where you have accounts. They can autofill the values for you to save you having to remember them. If you have multiple accounts on one site, you get a choice of which account to use.

LastPass has been recommended to me before and is a required at my work, therefore it is my password manager solution for work and personal credentials. As an alternative, there is [1password.com](https://1password.com), but I have not used it.

### Reasons to not use a browser's own password storage

- There is a risk in someone accessing your passwords if your browser is left open.
- There is no master password setup default.
- Your passwords could be synced, so someone signed into Chrome/Firefox as you on another machine could get your passwords. 

### Reasons to use LastPass

- LastPass is built as a central credentials storage location and it does this great. You don't have to manage credentials across Chrome, Firefox and whatever other documents you use. 
- You can force LastPass to require a password after a period of inactivity or reopening the browser.
- LastPass has a more elegant way of adding/updating/viewing/searching your site logins.
- LastPass allows storing of text notes, for extra details around a site.
- It works on desktop and mobile. 

## Two-factor Authentication

Some websites support _two-factor authentication (2FA)_. This means that you need both the password (entered on desktop or mobile) and your actual mobile device (for a one time pin) in order to login in. Use this for your most important or sensitive accounts where 2FA is supported, to protect them even if your password is stolen/guessed. Such as for your password manager, Twitter, Gmail, Github and AWS.

### Method

You can use **SMS**, which is tied to a simcard in a mobile device and does not need an internet connection. You need to wait for an SMS to arrive with a security code.

You use can use a **security app** like Google Authenticator (see below), which is also tied to a phiyscal mobile device but works without needing a simcard or internet connecion. This generates codes every 60 seconds for all your accounts - the codes expire in 60 seconds and are replaced by new codes.

Using the SMS method to get a security is sufficient, but using a security app can be more convenient and more secure. There is no waiting time like there is for an SMS, which may not be secure and also the SMS code does not have the same 60-second expiry.

## Get secured

### How to setup 2FA

1. Download the Google Authenticator app for your phone. Do this now or as part of the next step.
    - Android and iOS links [here](https://support.google.com/accounts/answer/1066447) with instructions. 
1. Folow the steps here to setup [Google 2-step authentication](https://www.google.com/landing/2step/), to protect your Google account. You will be guided to setting up Google Authenticator app, starting with your Gmail account address under a _Google_ item.
1. Add more accounts to your Google Authenticator. It is easy to add additional sites. Sites which support 2FA usually make use of your camera phone to scan a QR code on your desktop screen.

### How to setup LastPass

Below are the steps I suggest to completely replace your password storage approach with LassPass and two setup two-factor authentication for Google, LastPass and any other sites you wish to.

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
    
### 2FA backup codes

Make sure you have a way to login to Google and LastPass without your device, in case you have an issue with 2FA (such as your device is lost or not with you).

Go into your account and under the security section, get the backup codes. There will be about fixed 10 codes which can be used once (you can also generate a new set in case they are compromised). For site like Google and Github, can save your codes as a long text note in LastPass. Though of course there is the danger that if someone is in your LastPass account without your device, they can get into other accounts even easier.

An alternative is to print out the backup codes and keep them somewhere secure at home or work or at a friend.

Printing codes is needed for LastPass as the codes will be inaccessible without the codes or a device.
