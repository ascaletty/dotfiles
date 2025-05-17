
export EDITOR= nvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
. "$HOME/.cargo/env"



alias cd="z"
alias cdi='zi'

export FZF_DEFAULT_OPTS='--prompt=">" --height 80% --layout=reverse --border'

# Default command
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/" --glob "!node_modules/" --glob "!vendor/" --glob "!undo/" --glob "!plugged/"'

# Preview them using bat
export BAT_THEME='gruvbox-dark'


function displayFZFFiles {
    echo $(fzf --preview 'bat --theme=gruvbox-dark --color=always --style=header,grid --line-range :400 {}')
}

function nvimGoToFiles {
    nvimExists=$(which nvim)
    if [ -z "$nvimExists" ]; then
      return;
    fi;

    selection=$(displayFZFFiles);
    if [ -z "$selection" ]; then
        return;
    else
        nvim $selection;
    fi;
}

function displayRgPipedFzf {
    echo $(rg . -n --glob "!.git/" --glob "!vendor/" --glob "!node_modules/" | fzf);
}

function nvimGoToLine {
    nvimExists=$(which nvim)
    if [ -z "$nvimExists" ]; then
      return;
    fi
    selection=$(displayRgPipedFzf)
    if [ -z "$selection" ]; then
      return;
    else 
        filename=$(echo $selection | cut -d: -f1)
        line=$(echo $selection | cut -d: -f2)
        nvim $(printf "+%s %s" $line $filename) +"normal zz^";
    fi
}


function fdFzf {
	fdExists=$(which fd)
	if [ -z "$fdExists" ]; then
					return;
	else
    if [ "$(pwd)" = "$HOME" ]; then
      goTo=$(fd -t d -d 1 . | fzf)
      if [ -z "$goTo" ]; then
        return;
      else 
        cd $goTo
        return;
      fi
    fi
    goTo=$(fd -t d . | grep -vE '(node_modules)' | fzf)
    if [ -z "$goTo" ]; then
      return;
    else 
      cd $goTo
    fi
	fi
}

function tmuxAttachFZF {
  tmuxExists=$(which tmux)
  if [ -z "$tmuxExists" ]; then
    return;
  fi

  sessions=$(tmux ls)
  if [ -z "$sessions" ]; then
    return;
  fi

  selectedSession=$(echo $sessions | awk -F ':' '{print $1}' | fzf)
  if [ -z "$selectedSession" ]; then
    return;
  fi
  tmux attach -t $selectedSession;
}

function tmuxKillFZF {
  tmuxExists=$(which tmux)
  if [ -z "$tmuxExists" ]; then
    return;
  fi

  sessions=$(tmux ls)
  if [ -z "$sessions" ]; then
    return;
  fi

  selectedSession=$(echo $sessions | awk -F ':' '{print $1}' | fzf)
  if [ -z "$selectedSession" ]; then
    return;
  fi
  tmux kill-session -t $selectedSession;
}


alias nf='nvimGoToFiles'
alias ngl='nvimGoToLine'
alias fzd='fdFzf'
alias ta='tmuxAttachFZF'
alias tk='tmuxKillFZF'
alias dfz= 'displayFZFFiles' 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias y ='yazi'

