# Open dotfiles directory.
od-open-config () {
    cd $DOTFILES_DIR
    cd $(ls | fzf)
    nvim $(pwd)
    cd $HOME
}

# Open work projects directory.
od-open-project-work () {
    cd $HOME/Projects/work/
    cd $(ls | fzf)
    dirname=${PWD##*/}
    echo $dirname
    tmux new-session -s $dirname
}

# Open personal projects directory.
od-open-project-personal () {
    cd $HOME/Projects/personal/
    cd $(ls | fzf)
    dirname=${PWD##*/}
    echo $dirname
    tmux new-session -s $dirname
}
