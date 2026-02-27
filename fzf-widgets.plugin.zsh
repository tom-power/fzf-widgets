0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
export FZF_WIDGETS_HOME="${0:A:h}"

source "$FZF_WIDGETS_HOME"/fzf-widgets.zsh
