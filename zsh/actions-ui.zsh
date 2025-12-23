actions-ui() {
  if [[ -z "$TMUX" ]]; then
    SESSION_NAME="actions-$$"

    tmux new-session -d -s "$SESSION_NAME" "$HOME/.config/zsh/actions-menu"
    tmux attach -t "$SESSION_NAME"
    return
  fi

# --- SCENARIO 2: INSIDE TMUX ---

  # 1. Capture the target pane (the pane that invoked actions-ui)
  local main_id
  main_id=$(tmux display-message -p '#{pane_id}')
  echo "$main_id" > "$HOME/.config/zsh/.actions_target_id"

  # 2. Launch the menu pane (fixed height)
  local menu_id
  menu_id=$(tmux split-window -v -f -l 7 -P -F "#{pane_id}" "$HOME/.config/zsh/actions-menu")

  # 3. Resize hook that preserves focus
  tmux set-hook -w client-resized \
    "run-shell 'prev=\$(tmux display-message -p \"#{pane_id}\"); tmux resize-pane -t \"$menu_id\" -y 7; tmux select-pane -t \"\$prev\"'"
}

