# System Configuration and Utilities

It needs to be placed in user home directory to work properly!

## Folder setup

- `system-setup/` - directory with user settings, configuration and installation scripts
  - `startup.sh` - script that launches all other scripts use with `sudo`
  - `configuration/` - directory containing files to configure gnome and other settings
  - `dotfiles/` - directory containing user dotfiles, these are symlinked to users home directory
  - `installation/` - directory containing installation scripts, all of these use `apt` packager manager
- `utilities/` - utilites for maintaining system and speeding up development
  - `programs/`- scripts that work with specific applications
  - `scripts/` - utility scripts, symlinked to `bin/` (directory is added to `$USER`)

## Operating system

It works with gnome-shell and Ubuntu.
