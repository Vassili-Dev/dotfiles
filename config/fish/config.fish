if status is-interactive
    # Commands to run in interactive sessions can go here
  if type -q starship
    starship init fish| source
  end
  if type -q pyenv
    pyenv init - | source
  end
  set -gx MOZ_ENABLE_WAYLAND 1
end
