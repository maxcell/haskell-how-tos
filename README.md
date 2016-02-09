# COP 4020 Help Guide
You are probably a student over at the University of Central Florida and want some guidance on how to really make it through the class! Well look no more! This is a repository to help students find a curated list of questions and potential answers by the Spring 2016 class taught by Professor Wocjan.

Here is what our current topics are:

[Installing Haskell (OSX)](#installing-haskell-osx)
[Installing Haskell (Windows)](#installing-haskell-windows)

### Installing Haskell (OSX)
If you run OSX, you can install Haskell simply by running an awesome and simple command through [Homebrew](http://brew.sh/)(if you don't have this now, please get it because this will do a great job for you as far as package manager) `brew install ghc cabal-install` This should install both `ghc` and the dependency `cabal-install`. (**Do not perform the deprecated command `brew install haskell-platform`.**) It will refer you back to the previous command).

If you wish to not have Homebrew, you can also install the latest [Haskell Platform](https://www.haskell.org/platform/).

### Installing Haskell (Windows)
**UNVERIFIED**
Simply download the appropriate installer from the [Haskell Platform website](https://www.haskell.org/platform/#windows). Run the installer and then you can launch the WinGHCi application! (**NOTE: I do not own a Windows machine, therefore I cannot guarantee the installation will work properly, so be sure to do your own research if not able to properly work. If you own a Windows machine, feel free to fork and set up a Pull Request.**)

### Installing Haskell (Linux)
You should be able to find the appropriate installation commands from the [Haskell Platform website](https://www.haskell.org/downloads/linux) as far as the Haskell bundle necessary. It has a list of commands for Ubuntu and Fedora and Arch Linux. It also has guided instructions as far as manually setting up Haskell as well (however, I would strongly suggest utilizing the packages that are already curated for you).
