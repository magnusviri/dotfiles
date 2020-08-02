#!/bin/sh

if [ -e /usr/local/bin/mak.py ]; then

	/usr/local/bin/mak.py -q pref Clock.User.ShowSeconds

    /usr/local/bin/mak.py -q pref Dock.User.DisableAllAnimations=1

    /usr/local/bin/mak.py -q pref Finder.User.DisableAllAnimations=true

    /usr/local/bin/mak.py -q pref Finder.User.FXEnableExtensionChangeWarning=false
    /usr/local/bin/mak.py -q pref Finder.User.NewWindowTarget=PfHm
    /usr/local/bin/mak.py -q pref Finder.User.ShowExternalHardDrivesOnDesktop=true
    /usr/local/bin/mak.py -q pref Finder.User.ShowHardDrivesOnDesktop=true
    /usr/local/bin/mak.py -q pref Finder.User.ShowMountedServersOnDesktop=true
    /usr/local/bin/mak.py -q pref Finder.User.ShowRemovableMediaOnDesktop=true
    /usr/local/bin/mak.py -q pref Finder.User.ShowStatusBar=true
    /usr/local/bin/mak.py -q pref Finder.User._FXShowPosixPathInTitle=true

    /usr/local/bin/mak.py -q pref Global.User.FullKeyboardAccess=2

    /usr/local/bin/mak.py -q pref KeyboardShortcuts.User.MissionControlEnable=false
    /usr/local/bin/mak.py -q pref KeyboardShortcuts.User.MissionControl2Enable=false
    /usr/local/bin/mak.py -q pref KeyboardShortcuts.User.ApplicationWindows2Enable=false
    /usr/local/bin/mak.py -q pref KeyboardShortcuts.User.ApplicationWindowsEnable=false

    /usr/local/bin/mak.py -q pref Mouse.User.Click.Double
    /usr/local/bin/mak.py -q pref Mouse.User.SecondaryClick=TwoButton
    /usr/local/bin/mak.py -q pref Mouse.User.SmartZoom=0
    /usr/local/bin/mak.py -q pref Mouse.User.SwipeBetweenApps=false
    /usr/local/bin/mak.py -q pref Mouse.User.SwipeBetweenPages=false

    #/usr/local/bin/mak.py -q pref Safari.User.HomePage=http://example.com - Set Safari's homepage; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.LastSafariVersionWithWelcomePage=<string> - Gets rid of the Welcome to Safari message; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.NewAndTabWindowBehavior=<int> - Sets what Safari shows in new tabs and windows; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.NewTabBehavior=<int> - Sets what Safari shows in new tabs; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.NewWindowBehavior=<int> - Sets what Safari shows in new windows; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.Show_Tabs_Status_Favorites=<true|false> - Turns on or off Tab, Status, and Favorites bar; 1 arg; user domain (10.11)
    #/usr/local/bin/mak.py -q pref Safari.User.WebKitInitialTimedLayoutDelay=<float> - ; 1 arg; user domain (10.11)

    /usr/local/bin/mak.py -q pref ScreenSaver.User.Basic.Message="Dad's Laptop"
    /usr/local/bin/mak.py -q pref ScreenSaver.User.Computer_Name
    /usr/local/bin/mak.py -q pref ScreenSaver.User.Computer_Name_Clock
    /usr/local/bin/mak.py -q pref ScreenSaver.User.askForPassword=1

    /usr/local/bin/mak.py pref Screencapture.User.disable-shadow=true

else
	echo /usr/local/bin/mak.py not installed
fi

if [ ! -e  ~/.gitignore_global ]; then
	echo .DS_Store > ~/.gitignore_global
else
	echo yes
fi

git config --global user.name "James Reynolds"
git config --global user.email "magnusviri@me.com"
#git config --global core.excludesfile ~/.gitignore_global

echo "Don't forget to fix .ssh/config"
echo "Don't forget to copy ~/.s3cfg"

# git clone https://github.com/magnusviri/ta-markdown.git
# mv ta-markdown.git markdown
