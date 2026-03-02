# --- Fix WezTerm scrolling/jumping while typing ---
# (Disables OSC 133 shell integration markers that can cause scrollback jumps)
$env.config.shell_integration.osc133 = false

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.config.buffer_editor = "nvim"

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# source ~/.config/nushell/nu_scripts/themes/nu-themes/solarized-dark-higher-contrast.nu
source ~/.config/nushell/nu_scripts/themes/nu-themes/ayu.nu
