# /etc/profile

# Set our umask
umask 022

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
append_path "$HOME/.local/bin"
append_path "$HOME/go/bin"

# Force PATH to be environment
export PATH

# Set EDITOR
export EDITOR=vi

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Unload our profile API functions
unset -f append_path

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r $HOME/.bashrc
then
	. $HOME/.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
