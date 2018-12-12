#!/usr/bin/env bash
cd $(dirname $0)
pwd

if [ $(whoami) = "root" ]; then
    echo "[MAIN] starting"
else
    echo "[MAIN] error: run this with sudo!!!"
    exit 1
fi

linkDotfiles () {
  echo "Symlink files: "
  echo $(ls -A dotfiles)
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    ln -sv dotfiles/.aliases $HOME
    ln -sv dotfiles/.bash_profile $HOME
    ln -sv dotfiles/.bashrc $HOME
    ln -sv dotfiles/.exports $HOME
    ln -sv dotfiles/.functions $HOME
    ln -sv dotfiles/.gitconfig $HOME
    ln -sv dotfiles/.gitignoreglobal $HOME
    ln -sv dotfiles/.vimrc $HOME
  else 
    echo "Configuration canceled"
    return 1
  fi
}

configure () {
  echo "Run scripts in configuration directory:"
  echo $(ls -A configuration)
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    . configuration/folder-setup.sh
    . configuration/gnome.sh
    . configuration/intellij.sh
    echo "Configuration finished"

  else 
    echo "Configuration canceled"
    return 1
  fi
}

install () {
  echo "Install utilities"
  echo $(ls -A installation)
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    echo "Installing stuff"
    . installation/basic-stuff.sh
    . installation/docker.sh
    . installation/java.sh
    . installation/javascript.sh
    . installation/azure-cli.sh
    . installation/go.sh
    echo "Installation finished"
  else 
    echo "Installation canceled"
    return 1
  fi

}

linkDotfiles
configure
install