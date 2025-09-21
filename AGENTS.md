# Repository Guidelines

## Project Structure & Module Organization
This repository is managed through `chezmoi`. Host-specific settings live in the root as `dot_*` files. Shared configs sit under `dot_config/`; for example, `dot_config/nvim` contains the Lua-based Neovim setup with `lua/` modules and `dot_stylua.toml`, while `dot_config/hypr` holds Hyprland/window rules. Service definitions land in `systemd/`, and UI assets in `waybar/` and `sketchybar/`. Infrastructure helpers reside in `media-stack/` (Docker Compose templates) and `run_once_install.sh.tmpl` bootstraps dependencies. Keep new files consistent with this layout and prefer `.tmpl` when values are machine-specific.

## Build, Test, and Development Commands
- `chezmoi status` previews pending changes relative to the target system.
- `chezmoi diff` shows rendered diffs; add `--reverse` when reviewing imported files.
- `chezmoi apply --dry-run` validates template rendering without writing.
- `chezmoi apply` deploys updates; use `--include=path:dot_config/nvim` for scoped changes.
- For the media stack, run `docker compose -f media-stack/docker-compose.yml config` to confirm merged templates before `docker compose ... up`.

## Coding Style & Naming Conventions
Match surrounding formatting and indentation (Lua: two spaces, shell: two spaces, Hyprland: align directives). Use descriptive, lowercase-hyphen filenames for templates and keep machine-specific variants as `.tmpl`. Run `stylua --config-path dot_config/nvim/dot_stylua.toml lua/` before committing Lua changes. For shell scripts, run `shfmt -i 2` and `shellcheck`. Keep environment variables uppercase and scoped.

## Testing Guidelines
After edits, run `chezmoi diff` and `chezmoi apply --dry-run`. Balance view with `chezmoi audit` if available. Validate Docker updates with `docker compose ... config` and start in a disposable session. For systemd units, run `systemd-analyze verify systemd/<unit>.service` on target hosts. Smoke-test UI tweaks by reloading the relevant process (`waybar -r`, `pkill sketchybar`).

## Commit & Pull Request Guidelines
Write concise, imperative commits (e.g., “Adjust hypr gaps”). Group related changes together and avoid mixing machine-local tweaks with shared configs. Document intent and any manual steps in the PR description, link related issues, and include screenshots or logs for visible changes. Confirm you ran the validation commands above before requesting review.

## Configuration & Secrets
Never hard-code secrets; use `chezmoi secret` or environment lookups and keep credentials outside tracked files. Store machine identifiers under `.tmpl` and guard host-specific logic with `if eq .chezmoi.os` blocks.
