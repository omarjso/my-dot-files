# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"
ZSH_THEME="robbyrussell"
plugins=(git)

export LESS=FRX

# OS specific config, kept for some of my macbook configs
case "$(uname -s)" in
  Darwin)
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-19.jdk/Contents/Home"
    if command -v brew >/dev/null 2>&1; then
      export NVM_DIR="$HOME/.nvm"
      [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
    fi
    ;;
  Linux)
    ;;
esac

# Aliases
[ -f "$HOME/dot_files/.common_aliases" ] && source "$HOME/dot_files/.common_aliases"
