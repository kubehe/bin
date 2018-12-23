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

    backupIfFileExistsAndLink .aliases
    backupIfFileExistsAndLink .bash_profile
    backupIfFileExistsAndLink .bashrc
    backupIfFileExistsAndLink .exports
    backupIfFileExistsAndLink .functions
    backupIfFileExistsAndLink .gitconfig
    backupIfFileExistsAndLink .gitignoreglobal
    backupIfFileExistsAndLink .vimrc
  else 
    echo "Configuration canceled"
    return 1
  fi
}

backupIfFileExistsAndLink () {
  if [ -f $HOME/${1} ]; then
    mv $HOME/${1} $HOME/${1}.old-version
  fi
  ln -rsv dotfiles/${1} $HOME
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
    . configuration/terminal.sh
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