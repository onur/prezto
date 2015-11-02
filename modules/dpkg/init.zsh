#
# Defines dpkg aliases.
#
# Authors:
#   Daniel Bolton <dbb@9y.com>
#   Benjamin Boudreau <boudreau.benjamin@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[dpkg] && ! $+commands[apt-get] )); then
  return 1
fi

#
# Aliases
#

# Cleans the cache.
alias debc='sudo apt-get clean && sudo apt-get autoclean'
alias aptc='sudo aptitude clean'

# Displays a file's package.
alias debf='apt-file search --regexp'
alias aptf='aptitude search'
alias apts='aptitude search'

# Installs packages from repositories.
alias debi='sudo apt-get install'
alias apti='sudo aptitude install'

# Installs packages from files.
alias debI='sudo dpkg -i'

# Displays package information.
alias debq='apt-cache show'
alias aptq='apt-cache show'

# Updates the package lists.
alias debu='sudo apt-get update'
alias aptu='sudo aptitude update'

# Upgrades outdated packages.
alias debU='sudo apt-get update && sudo apt-get dist-upgrade'
alias aptu='sudo aptitude update && sudo aptitude safe-upgrade'
alias aptU='sudo aptitude update && sudo aptitude dist-upgrade'

# Removes packages.
alias debx='sudo apt-get remove'
alias aptr='sudo aptitude remove'
alias aptp='sudo aptitude purge'

# Removes packages, their configuration, and unneeded dependencies.
alias debX='sudo apt-get remove --purge && sudo apt-get autoremove --purge'

# Searches for packages.
if (( $+commands[aptitude] )); then
  alias debs='aptitude -F "* %p -> %d \n(%v/%V)" --no-gui --disable-columns search'
else
  alias debs='apt-cache search'
fi

# Creates a basic deb package.
alias deb-build='time dpkg-buildpackage -rfakeroot -us -uc'

# Removes all kernel images and headers, except for the ones in use.
alias deb-kclean='sudo aptitude remove -P "?and(~i~nlinux-(ima|hea) ?not(~n`uname -r`))"'
