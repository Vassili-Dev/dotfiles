{ pkgs ? import <nixpkgs> {} }:

[
  pkgs.fish
  pkgs.tmux
  pkgs.eza
  pkgs.ripgrep
  pkgs.neovim
  pkgs.starship
  pkgs.pyenv
]
