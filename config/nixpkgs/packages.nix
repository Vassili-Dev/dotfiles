{ pkgs ? import <nixpkgs> {} }:

[
  pkgs.fish
  pkgs.tmux
  pkgs.exa
  pkgs.ripgrep
  pkgs.neovim
  pkgs.starship
  pkgs.pyenv
]
