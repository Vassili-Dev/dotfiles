if status is-interactive
    # Commands to run in interactive sessions can go here
  starship init fish | source
  pyenv init - | source
  set -gx MOZ_ENABLE_WAYLAND 1
end
