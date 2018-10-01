#!/bin/bash

# install liteide linux 32 bit golang ide into /usr/local
wget -c "https://downloads.sourceforge.net/project/liteide/X32.2/liteidex32.2.linux32-qt4.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fliteide%2Ffiles%2FX32.2%2F&ts=1501868660&use_mirror=jaist" -O liteide.tar.bz2

tar -xf liteide.tar.bz2
cd liteide

# update liteide.desktop to use the tools in /usr/local after
# they are installed
sed -i -e 's#Exec=liteide#Exec=/usr/local/bin/liteide#' liteide.desktop
sed -i -e 's#Icon=liteide#Icon=/usr/local/share/liteide/welcome/images/liteide128.xpm#' liteide.desktop

sudo mv bin/* /usr/local/bin
sudo mv lib/liteide /usr/local/lib
sudo mv share/liteide /usr/local/share

mv liteide.desktop ~/.local/share/applications

echo "LiteIDE Linux 32-bit installed"
