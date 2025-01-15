# If you come from bash you might have to change your $PATH.
# Path to your Oh My Zsh installation.
plugins=(git brew sudo zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Location of oh-my-posh config file
eval "$(oh-my-posh init zsh --config ~/.mytheme.omp.json)"

zstyle ':omz:update' mode auto        # update automatically without asking
zstyle ':omz:update' frequency 14

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Set working directory
cd ~/sbemode

# Aliases for Frequent Commands
## SBEMODE alias
alias sb='cd ~/sbemode/orgmode && emacs --eval "(progn (org-agenda nil \"a\") (org-agenda-day-view) (delete-other-windows))"'

## AI-related aliases for ollama and fabric
alias ol='ollama'
alias olon='brew services restart ollama'
alias oll='ollama run llama3.1:latest'
alias olp='ollama run py:latest'
alias olv='ollama run llama3.1:latest --verbose'
alias oloff='brew services stop ollama'
alias ls='ls -hal'
