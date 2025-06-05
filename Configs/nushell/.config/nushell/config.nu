mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"

source ~/.zoxide.nu
alias cd = z 
alias cdi = zi
alias ls = ls -a
alias spac = sudo pacman 


