# actions-ui

A tmux-powered command palette for the terminal.

## What this is
- Persistent actions menu (fzf-based)
- Targeted execution into another pane
- Mouse- and keyboard-friendly
- tmux lifecycle managed explicitly

## What this is not
- A general dotfiles repo
- A tmux plugin (yet)

## Components
- `bin/actions` – selector + dispatcher
- `zsh/actions-ui.zsh` – tmux UI orchestration
- `zsh/actions-menu` – persistent menu loop
- `zsh/tmux-autostart.zsh` – lifecycle bootstrap

## Philosophy
- tmux owns the terminal early
- UI and execution are separate
- late binding of target pane and CWD

