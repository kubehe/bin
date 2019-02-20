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

    backupIfFileExistsAndLink .aliases $HOME
    backupIfFileExistsAndLink .bash_profile $HOME
    backupIfFileExistsAndLink .bashrc $HOME
    backupIfFileExistsAndLink .exports $HOME
    backupIfFileExistsAndLink .functions $HOME
    backupIfFileExistsAndLink .gitconfig $HOME
    backupIfFileExistsAndLink .gitignoreglobal $HOME
    backupIfFileExistsAndLink .vimrc $HOME

    mkdir -p .config/nvim/
    chown $(echo $USER):$(id -gn $USER) $HOME/.config/nvim
    backupIfFileExistsAndLink init.vim $HOME/.config/nvim
  else 
    echo "Configuration canceled"
    return 1
  fi
}

backupIfFileExistsAndLink () {
  if [ -f ${2} ]; then
    mv ${2} ${2}.old-version
  fi

  ln -rsv dotfiles/${1} ${2}

  chown $(echo $USER):$(id -gn $USER) ${2} -h #? I don't know if there is more elegant solution
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