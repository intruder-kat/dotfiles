#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias reload='source ~/.bashrc'
alias vim=nvim

# define color escape codes
# these will use whatever we define in xrdb
BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"

BRIGHTBLACK="\[\e[90m\]"
BRIGHTRED="\[\e[91m\]"
BRIGHTGREEN="\[\e[92m\]"
BRIGHTYELLOW="\[\e[93m\]"
BRIGHTBLUE="\[\e[94m\]"
BRIGHTMAGENTA="\[\e[95m\]"
BRIGHTCYAN="\[\e[96m\]"
BRIGHTWHITE="\[\e[97m\]"

### define some basic "units" I may want in my ps
### like status code, git branch, etc

# display one prefix on success, other on failure
_statcode="[ \$? -eq 0 ] && printf \"${GREEN}uwu\" || printf \"${RED}ಠ_ಠ\""

# show git branch for this dir if we're in a repo
# unless we're in ~, since that's where my dotfile .git is
_git="[[ \$(pwd) == \$HOME ]] || printf \"${YELLOW}[\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)] \""

PS1="${CYAN}╔ \$($_statcode) ${CYAN}\u${MAGENTA}@${BLUE}\h${WHITE} \$($_git)${CYAN}\w\n${CYAN}╚> ${WHITE}"

PS2="${CYAN}~ ${WHITE}"


