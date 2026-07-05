#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status,
# or if an undefined variable is used.
set -euo pipefail

# --- Configuration ---
#LOG_FILE="script_execution.log"

# Define ANSI Color Codes for Terminal Output
COLOR_RESET="\033[0m"
COLOR_DEBUG="\033[36m"   # Cyan
COLOR_INFO="\033[32m"    # Green
COLOR_WARN="\033[33m"    # Yellow
COLOR_ERROR="\033[31m"   # Red

# --- Core Logging Function ---
log_message() {
    local level="$1"
    local color="$2"
    local message="$3"
    local timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # 1. Print colorized log to Console (stderr is standard for logs)
    echo -e "${color}[${timestamp}] [${level}] ${message}${COLOR_RESET}" >&2

    # 2. Append clean text log to File (strips ANSI color codes)
    #echo "[${timestamp}] [${level}] ${message}" >> "$LOG_FILE"
}

# --- Helper Functions for Log Levels ---
log_debug() { log_message "DEBUG" "$COLOR_DEBUG" "$1"; }
log_info()  { log_message "INFO"  "$COLOR_INFO"  "$1"; }
log_warn()  { log_message "WARN"  "$COLOR_WARN"  "$1"; }
log_error() { log_message "ERROR" "$COLOR_ERROR" "$1"; }

# --- Example Usage ---

main() {
    log_info "Starting the automation script..."

    log_debug "Checking system prerequisites..."
    
    # Simulating a non-critical warning
    local available_space=15
    if [ "$available_space" -lt 20 ]; then
        log_warn "Low disk space detected (${available_space}% remaining)."
    fi

    log_info "Processing data batch..."

    # Simulating an error condition
    local simulated_error=true
    if [ "$simulated_error" = true ]; then
        log_error "Failed to connect to the remote database server!"
        # You could choose to exit here using 'exit 1'
    fi

    log_info "Script run completed."
}

# Execute main function
main
