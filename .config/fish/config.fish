
#
# for autojump
#
function j
   cd (command autojump $argv)
end

# bootstrap fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# peco
set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# rbenv
rbenv init - | source

# pyenv
pyenv init - | source

# swiftenv
if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end

# android
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;

# flutter
set -gx PATH ~/Development/Flutter/flutter/bin $PATH;
