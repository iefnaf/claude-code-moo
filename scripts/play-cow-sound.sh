#!/usr/bin/env bash
#
# Cow Moo Sound Player
# Plays a cow moo sound when Claude Code requires user authorization
#
# Environment variables:
#   CLAUDE_PLUGIN_ROOT - Absolute path to plugin directory
#

set -eo pipefail

# Paths
# Automatically find audio file relative to script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUDIO_FILE="${SCRIPT_DIR}/../assets/cow-moo.mp3"

# Play audio based on platform
play_sound() {
    local os_type=$(uname -s)

    case "${os_type}" in
        Darwin*)
            # macOS - use afplay
            if command -v afplay &> /dev/null && [[ -f "${AUDIO_FILE}" ]]; then
                afplay -v 1.0 "${AUDIO_FILE}" 2>/dev/null &
                return 0
            fi
            ;;
        Linux*)
            # Linux - try paplay (PulseAudio), then aplay (ALSA)
            if command -v paplay &> /dev/null && [[ -f "${AUDIO_FILE}" ]]; then
                paplay --volume=65536 "${AUDIO_FILE}" 2>/dev/null &
                return 0
            elif command -v aplay &> /dev/null && [[ -f "${AUDIO_FILE}" ]]; then
                aplay -q "${AUDIO_FILE}" 2>/dev/null &
                return 0
            fi
            ;;
        MINGW*|MSYS*|CYGWIN*)
            # Windows - use PowerShell
            if [[ -f "${AUDIO_FILE}" ]]; then
                powershell.exe -c "(New-Object Media.SoundPlayer '${AUDIO_FILE}').PlaySync()" 2>/dev/null &
                return 0
            fi
            ;;
    esac

    # Fallback: terminal bell
    echo -en "\a" 2>/dev/null || true
    return 0
}

# Main execution
play_sound
exit 0
