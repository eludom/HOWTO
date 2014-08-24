#! /bin/sh -x -u -e
#
# Get latest version of org-mode in ~/src/org-mode
#

mkdir -p ~/src
cd ~/src

# pull for first time if we don't have it

if [ ! -d ~/src/org-mode ]; then
    git clone git://orgmode.org/org-mode.git
else

    # get updates, if any
    
    cd ~/src/org-mode
    git pull
fi

# build the autoloads
cd ~/src/org-mode
make autoloads

# Add to .emacs, .emacs.d/init.el, whatever...
#
#(add-to-list 'load-path "~/src/org-mode/lisp/")
#(add-to-list 'load-path "~/src/org-mode/contrib/lisp/" t)

   
