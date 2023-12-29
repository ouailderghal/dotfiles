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

# Change directory into work projects.
od-cd-project-work () {
    cd $HOME/Projects/work/
    cd $(ls | fzf)
}

# Open personal projects directory.
od-open-project-personal () {
    cd $HOME/Projects/personal/
    cd $(ls | fzf)
    dirname=${PWD##*/}
    echo $dirname
    tmux new-session -s $dirname
}

# Open Git Fugitive.
od-fugitive () {
    nvim +Git +only
}

# Open Git logs in Fugitive.
od-fugitive-log () {
    nvim -c "Git log" +only
}

# Open Git logs in Fugitive (one line).
od-fugitive-log-oneline () {
    nvim -c "Git log --oneline --decorate" +only
}
