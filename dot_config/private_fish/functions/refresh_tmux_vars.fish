function _update_tmux_ssh --on-event fish_prompt
#function refresh_tmux_vars --on-event="fish_preexec"
  if set -q TMUX
    bass (tmux show-environment -s)
  end
end
