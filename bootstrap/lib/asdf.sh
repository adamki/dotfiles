#!/usr/bin/env bash

# Require asdf to be available (e.g. installed via brew in step 05 or 07)
ensure_asdf() {
	if ! command -v asdf >/dev/null 2>&1; then
		log_error "asdf not found. Install with: brew install asdf"
		exit 1
	fi
}

# Add asdf plugin if not already present
asdf_ensure_plugin() {
	local plugin="$1"
	if ! asdf plugin list 2>/dev/null | grep -q "^${plugin}$"; then
		log_info "Adding asdf plugin: $plugin"
		asdf plugin add "$plugin"
	fi
}

# Install a version if not already installed, then set global default
asdf_ensure_version() {
	local plugin="$1"
	local version="$2"
	if ! asdf list "$plugin" 2>/dev/null | grep -q "$version"; then
		log_info "Installing $plugin $version..."
		asdf install "$plugin" "$version"
	fi
	asdf global "$plugin" "$version"
}
