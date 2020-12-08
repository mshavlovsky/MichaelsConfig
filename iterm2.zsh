# Adapted from https://gist.github.com/wadey/1140259
# Usage:
# source iterm2.zsh

# iTerm2 tab color commands
# https://iterm2.com/documentation-escape-codes.html

if [[ -n "$ITERM_SESSION_ID" ]]; then
    tab-color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a"
        echo -ne "\033]6;1;bg;green;brightness;$2\a"
        echo -ne "\033]6;1;bg;blue;brightness;$3\a"
    }
    tab-red() { tab-color 255 0 0 }
    tab-green() { tab-color 0 255 0 }
    tab-blue() { tab-color 0 0 255 }
    tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

    function iterm2_tab_precmd() {
        #tab-reset
        tab-color 120 120 120
    }

    function iterm2_tab_preexec() {
        if [[ "$1" == "dev" ]]; then
            tab-color 95 163 248
        else
            if [[ "$1" == "p" ]]; then
                tab-color 193 142 217
            else
                if [[ "$1" == "p3" ]]; then
                tab-color 243 172 71
                fi
            fi
        fi
    }

    autoload -U add-zsh-hook
    add-zsh-hook precmd  iterm2_tab_precmd
    add-zsh-hook preexec iterm2_tab_preexec
fi
