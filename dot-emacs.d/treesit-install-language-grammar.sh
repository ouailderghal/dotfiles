#!/bin/bash

TREESIT_GO_URL="https://github.com/tree-sitter/tree-sitter-go"
TREESIT_GOMOD_URL="https://github.com/camdencheek/tree-sitter-go-mod"
TREESIT_BASH_URL="https://github.com/tree-sitter/tree-sitter-bash"
TREESIT_PYTHON_URL="https://github.com/tree-sitter/tree-sitter-python"

build_treesit_module() {
    local repo_url=$1
    local repo_name=$(echo "$repo_url" | sed 's|.*/||')
    local branch=$2

    echo "[INFO] Cloning $repo_url"
    if [[ ! -d $repo_name ]]; then
	git clone --depth=1 --branch="$branch" "$repo_url"
    else
	echo "[INFO] Directory $repo_name already exists, skipping clone"
    fi

    echo "[INFO] Building and installing $repo_name"
    sudo make -C "$repo_name" install
}

build_treesit_module "$TREESIT_GO_URL" "v0.23.4"
build_treesit_module "$TREESIT_GOMOD_URL" "v1.1.0"
build_treesit_module "$TREESIT_BASH_URL" "v0.23.3"
build_treesit_module "$TREESIT_PYTHON_URL" "v0.23.2"
