# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview

Claude Code Cow Moo Notification is a simple plugin that plays a cow moo sound when user authorization is required. It uses Claude Code's Notification hook system.

## Plugin Structure

```
.claude-plugin/
├── plugin.json      # Plugin metadata
├── marketplace.json # Marketplace configuration
└── hooks.json       # Hook registration (Notification/permission_prompt)

assets/
└── cow-moo.mp3      # Cow sound audio file

scripts/
└── play-cow-sound.sh # Audio playback script
```

## How It Works

1. **Hook Trigger**: When Claude Code shows a permission prompt, the Notification hook fires
2. **Matcher**: The `permission_prompt` matcher filters for authorization-related notifications
3. **Command**: The hook executes `play-cow-sound.sh` with 5-second timeout
4. **Audio**: Script plays cow-moo.mp3 using platform-appropriate audio player
5. **Fallback**: If audio unavailable, falls back to terminal bell

## Environment Variables

The hook makes these variables available:
- `${CLAUDE_PLUGIN_ROOT}`: Absolute path to plugin directory (e.g., `~/.claude/plugins/claude-code-moo`)

## Testing

### Test the sound directly:
```bash
~/.claude/plugins/claude-code-moo/scripts/play-cow-sound.sh
```

### Test with a permission prompt:
1. Ask Claude Code to run a Bash command
2. You should hear the cow moo when the permission dialog appears

### Check hook registration:
```bash
cat ~/.claude/plugins/claude-code-moo/.claude-plugin/hooks.json
```

## Modifying the Sound

To change the sound:
1. Download a new audio file (royalty-free)
2. Replace `assets/cow-moo.mp3`
3. Keep it short (1-3 seconds) for best experience

Good sources: [Pixabay](https://pixabay.com/sound-effects/search/cow/), [Mixkit](https://mixkit.co/free-sound-effects/cow/)

## Platform-Specific Commands

- **macOS**: `afplay -v 1.0 file.mp3` (built-in)
- **Linux**: `paplay --volume=65536 file.mp3` (PulseAudio) or `aplay -q file.mp3` (ALSA)
- **Windows**: PowerShell Media.SoundPlayer

## Error Handling

The script never exits with an error code. All errors are suppressed to avoid blocking the hook:
- Audio player missing → Silent failure
- Audio file missing → Fallback to terminal bell
- Playback error → Silent failure

This ensures the plugin never interferes with Claude Code's operation.