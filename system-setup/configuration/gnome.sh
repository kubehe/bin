#!/usr/bin/env bash

# dconf dump / > dconf-settings.ini # dumps gnome config

dconf load / < assets/dconf-settings.ini

gsettings set org.gnome.desktop.background picture-uri assets/carlsberg-moon.jpg