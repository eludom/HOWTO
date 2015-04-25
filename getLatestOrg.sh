#! /bin/sh -x -u -e
#
# Get latest version of org-mode in ~/elisp/org-mode
#

mkdir -p ~/elisp
cd ~/elisp

# pull for first time if we don't have it

if [ ! -d ~/elisp/org-mode ]; then
    git clone git://orgmode.org/org-mode.git
else

    # get updates, if any
    
    cd ~/elisp/org-mode
    git pull
fi

# build the autoloads
cd ~/elisp/org-mode
make autoloads

# Add to .emacs, .emacs.d/init.el, whatever...
#
#(add-to-list 'load-path "~/elisp/org-mode/lisp/")
#(add-to-list 'load-path "~/elisp/org-mode/contrib/lisp/" t)

   
