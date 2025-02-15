#!/bin/bash

# you will need to change permissions on the file before you can run it
# chmod +x ./snap.sh

# then at the end, reboot for everything to take effect
# sudo reboot now



# update and upgrade system
echo Update and upgrade system
sudo apt-get update -y
sudo apt-get dist-upgrade -y

# update Git
echo upgrade Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

# load GitHub CLI
echo load GitHub CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt install gh -y

# load some programs
echo Load programs
sudo apt install tree
sudo apt install unzip
sudo apt-get -y install python3-pip
# intall tmux
sudo apt-get intall tmux -y
sudo apt-get install vim -y

# load .vimrc file
echo Load .vimrc file
cp ./.vimrc ~/.vimrc

# load .tmux_conf file
echo Load .tmux_conf file
cp ./.tmux_conf ~/.tmux_conf

#load colorschemes
cp -r ~/the-infinity-gauntlet-snap/colors ~/.vim/colors

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# load .bashrc file
echo Load .bashrc file
> ~/.bashrc
cp ./.bashrc ~/.bashrc

# update the .bash_profile
sudo chown ubuntu ~/.bash_profile
echo '' >> ~/.bash_profile
echo 'if [ -f $HOME/.bashrc ]; then' >> ~/.bash_profile
echo '    source $HOME/.bashrc' >> ~/.bash_profile
echo 'fi' >> ~/.bash_profile

# copy over shell script file
echo Load shell script files
mkdir ~/scripts
cp ./repo.sh ~/scripts/repo.sh
sudo chmod +x ~/scripts/repo.sh
cp ./typescriptSetup.sh ~/scripts/typescriptSetup.sh
sudo chmod +x ~/scripts/typescriptSetup.sh
cp ./git-push.sh ~/scripts/git-push.sh
sudo chmod +x ~/scripts/git-push.sh
cp ./java-lint.sh ~/scripts/java-lint.sh
sudo chmod +x ~/scripts/java-lint.sh
cp ./commitgit.sh ~/scripts/commitgit.sh
sudo chmod +x ~/scripts/commitgit.sh
cp ./main.yml ~/scripts/main.yml
cp ./swift.yml ~/scripts/swift.yml

# load YouCompleteMe
echo Load YouCompleteMe plugin for Vim
# need to do an upgrade to python libraries first
sudo pip3 install --upgrade requests
sudo apt install vim-youcompleteme -y
vim-addon-manager install youcompleteme

sudo apt install npm -y
sudo apt install cmdtest -y

# Install rust
sudo apt  install cargo -y

sudo apt-get install libssl-dev
sudo apt install pkg-config

# Install solana cli
sudo cargo install spl-token-cli

# load node and typescript
sudo apt install nodejs
sudo npm install typescript -g
sudo npm install tslint typescript -g
sudo npm install eslint -g
sudo npm install -g ts-node
sudo npm install prompt-sync

cp ./index.ts ~/scripts/index.ts

# update node
sudo npm install -g n
sudo n stable

# load java programming software
echo load Java
sudo apt install default-jdk -y

# loading checkstyle for java
# https://github.com/checkstyle/checkstyle/releases
echo load CheckStyle for Java
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.44/checkstyle-8.44-all.jar
cp ./checkstyle-8.44-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/

# copy package-info.java
cp package-info.java ~/

# you might need to get a newer version of swift
# https://swift.org/download/
echo load Swift
sudo apt-get install -y clang libblocksruntime0 libcurl4-openssl-dev -y
wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.5-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.5-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
echo "" >> ~/.bashrc
echo 'export PATH="${PATH}":/usr/bin/swift/bin' >> ~/.bashrc

# SwiftLint
# https://github.com/realm/SwiftLint/releases to get latest release
echo load SwiftLint for Swift
wget https://github.com/realm/SwiftLint/releases/download/0.44.0/swiftlint_linux.zip
unzip -n swiftlint_linux.zip
sudo mkdir /usr/bin/swiftlint
sudo cp ./swiftlint /usr/bin/swiftlint/
echo 'export PATH="${PATH}":/usr/bin/swiftlint' >> ~/.bashrc
echo "" >> ~/.bashrc

# Swift syntax highlighting for Vim
# Original Source: http://wingsquare.com/blog/swift-script-syntax-highlighting-and-indentation-for-vim-text-editor/
# Another helpful article: https://billyto.github.io/blog/swift-syntax-vim
# More about Vim packages: http://vimcasts.org/episodes/packages/
echo "--- creating ~/.vim/pack/bundle/start dir.."
mkdir -p ~/.vim/pack/bundle/start
echo "--- Cloning Apple's Swift repo.."
git clone --depth=1 https://github.com/apple/swift/
echo "--- Copying plugin to Vim bundles.."
cp -r ./swift/utils/vim ~/.vim/pack/bundle/start/swift
# echo "--- Cleaning up, removing swift repo.."
# rm -rf ./swift/

# then remove the dot_files firectory 
sudo rm -R ~/dot_files

# reboot
echo ---
echo rebooting now ...
echo ---
sudo reboot now


