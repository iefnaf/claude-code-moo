# Claude Code Cow Moo Notification

A Claude Code plugin that plays a cow moo sound whenever user authorization is required.

## Features

- 🔊 Plays a cow moo sound when Claude Code needs your permission
- 🚫 Never miss a Bash authorization or file access prompt again
- 🎵 Works on macOS, Linux, and Windows
- ⚡ Non-blocking - doesn't interfere with your workflow
- 🎧 Graceful fallback to terminal bell if audio unavailable

## Installation

### Prerequisites

Before installing, you need to add the cow sound audio file:

1. Download a royalty-free cow moo sound from one of these sources:
   - [Pixabay - Cow Sounds](https://pixabay.com/sound-effects/search/cow/)
   - [Mixkit - Free Cow Sounds](https://mixkit.co/free-sound-effects/cow/)
   - [FreeSoundsLibrary - Cow Moo](https://www.freesoundslibrary.com/cow-moo-sound/)

2. Save the file as `cow-moo.mp3` in the `assets/` directory:
   ```bash
   # If you're installing from source
   cp /path/to/downloaded/cow-moo.mp3 ~/claude-code-moo/assets/cow-moo.mp3
   ```

### Step 1: Add the marketplace

Inside Claude Code, run:

```
/plugin marketplace add iefnaf/claude-code-moo
```

### Step 2: Install the plugin

```
/plugin install claude-code-moo
```

That's it! The cow moo sound will play automatically on the next permission prompt.

## How It Works

This plugin uses Claude Code's Notification hook to detect when permission prompts appear (Bash authorization, file access, etc.). When a prompt is detected, it plays a short cow moo sound to alert you.

## Configuration

Currently, there are no configuration options. The plugin works out of the box with default settings.

**Planned features:**
- Volume control
- Multiple sound options
- Enable/disable toggle

## Troubleshooting

### Sound not playing?

1. **Check audio file exists:**
   ```bash
   ls ~/.claude/plugins/claude-code-moo/assets/cow-moo.mp3
   ```

2. **Test the script directly:**
   ```bash
   ~/.claude/plugins/claude-code-moo/scripts/play-cow-sound.sh
   ```

3. **Check script permissions:**
   ```bash
   ls -l ~/.claude/plugins/claude-code-moo/scripts/play-cow-sound.sh
   # Should show -rwxr-xr-x (executable)
   ```

4. **Verify your audio player:**
   - macOS: `which afplay`
   - Linux: `which paplay` or `which aplay`
   - Windows: PowerShell available by default

### Want to disable temporarily?

Uninstall the plugin:
```
/plugin uninstall claude-code-moo
```

## Requirements

- Claude Code v1.0.80+
- No additional dependencies required

## License

MIT License - see LICENSE file for details

## Credits

- Cow sound effect from [Pixabay](https://pixabay.com/sound-effects/) (royalty-free)
- Built with Claude Code's hook system
