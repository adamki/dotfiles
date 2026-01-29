#!/usr/bin/env bash

# -----------------------------
# Colors (auto-disable if not TTY)
# -----------------------------
if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    BOLD='\033[1m'
    RESET='\033[0m'
else
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    BOLD=''
    RESET=''
fi

HR="------------------------------------------------------------"

# -----------------------------
# Logging functions
# -----------------------------
log_info() {
    echo -e "${BLUE}ℹ️  $*${RESET}"
}

log_success() {
    echo -e "${GREEN}✅ $*${RESET}"
}

log_warn() {
    echo -e "${YELLOW}⚠️  $*${RESET}"
}

log_error() {
    echo -e "${RED}❌ $*${RESET}" >&2
}

log_step() {
    echo -e "\n${BOLD}${HR}${RESET}"
    echo -e "${BOLD}▶ $*${RESET}"
    echo -e "${BOLD}${HR}${RESET}"
}

log_cmd() {
    echo -e "${BLUE}→ $*${RESET}"
}

# -----------------------------
# Debug tracing (optional)
# -----------------------------
if [[ "${DEBUG:-0}" == "1" ]]; then
    set -x
fi
