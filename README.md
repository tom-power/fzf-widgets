# fzf widgets

- `fzf-dirs-zfm` list bookmarked directories from [zfm](https://github.com/pabloariasal/zfm)
- `fzf-dirs` list recent directories from [dirs](https://ss64.com/bash/dirs.html), consider [dirpersist](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirpersist) plugin for this

## Usage

```zsh
bindkey '^O' fzf-dirs-zfm # default
bindkey '^E' fzf-dirs # default
```

set `FZF_WIDGETS_DEFAULT_OPTS` to override `FZF_DEFAULT_OPTS` for these widgets i.e.

```zsh
export FZF_WIDGETS_DEFAULT_OPTS="\
--bind '?:toggle-preview' \
--height=90% \
--preview-window right,60% \
--preview 'eza --header --long --git --color=always {}' \
" 
```

## Install

Depends on [fzf](https://github.com/junegunn/fzf), [zfm](https://github.com/pabloariasal/zfm).

Install with a [plugin manager](https://github.com/rossmacarthur/zsh-plugin-manager-benchmark) of your choice or manually:

```sh
git clone https://github.com/tom-power/fzf-widgets && source fzf-widgets/fzf-widgets.plugin.zsh
```
