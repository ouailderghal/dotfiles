TODO_SH="/usr/bin/todo.sh"
TODO_DIR="$HOME/.todo"

if [[ -f $TODO_SH ]] && [[ -d $TODO_DIR ]]; then
	alias todo="$TODO_SH -d $TODO_DIR/todo.cfg"
	source $TODO_DIR/todo_completion
fi
