# __overwrite_to_prompt, __select_from_list copied from
# https://github.com/pabloariasal/zfm/blob/master/zfm.zsh

function __overwrite_to_prompt() {
    if [[ -z "$1" ]]; then
        zle reset-prompt
        return 0
    fi
    LBUFFER="$(echo "$1" | tr -d '\r\n')"
    local ret=$?
    zle reset-prompt
    return $ret
}

local __fzf_widgets_list

function __select_from_list() {
    setopt localoptions pipefail no_aliases 2> /dev/null
    local opts="--reverse --exact --no-sort --cycle --height ${FZF_TMUX_HEIGHT:-40%} ${FZF_WIDGETS_DEFAULT_OPTS:-$FZF_DEFAULT_OPTS}"
    selected="$(\
    echo $__fzf_widgets_list \
    | sed -re 's/^[[:space:]]*[0-9]+[[:space:]]+//' \
    | sed "s/^~/${HOME//\//\\/}/ig" \
    | FZF_DEFAULT_OPTS="$@ ${opts}" fzf \
    | awk '{print $1}' \
    )"
    __overwrite_to_prompt "$selected"
}

function fzf-dirs() {
    __fzf_widgets_list=$(dirs -v | uniq | tail -n +2)
    __select_from_list
}

zle -N fzf-dirs
bindkey '^E' fzf-dirs

function fzf-dirs-zfm() {    
    __fzf_widgets_list=$(zfm list --dirs | sed -E 's/[[:space:]]*\[d\][[:space:]]*$//')
    __select_from_list
}

zle -N fzf-dirs-zfm
bindkey '^O' fzf-dirs-zfm
