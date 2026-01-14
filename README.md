<div align="center">

# 🐄 Claude Code Cow Moo Notification

**Never miss a permission prompt again!**

A lightweight Claude Code plugin that plays a gentle cow moo sound whenever user authorization is required.

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/iefnaf/claude-code-moo)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-1.0.80+-purple.svg)](https://code.anthropic.com)

</div>

---

## ✨ Why Use This Plugin?

When working with Claude Code, you've probably experienced this: you're coding away, switch to another window, and minutes later realize Claude is waiting for your permission to run a Bash command or access a file.

**This plugin solves that problem** by playing a friendly cow moo sound whenever Claude Code needs your attention, so you can:

- ✅ Respond to permission prompts immediately
- ✅ Keep your workflow uninterrupted
- ✅ Never miss important authorization requests again

---

## 🎯 Features

- 🔊 **Audio Alert** - Plays a cow moo sound on permission prompts
- 🚫 **Smart Detection** - Catches Bash, file access, and other authorization requests
- 🎵 **Cross-Platform** - Works on macOS, Linux, and Windows
- ⚡ **Non-Blocking** - Doesn't interfere with Claude Code's operation
- 🎧 **Graceful Fallback** - Falls back to terminal bell if audio unavailable
- 🪶 **Lightweight** - No external dependencies required

---

## 🚀 Installation

### Quick Install

Inside Claude Code, run:

```bash
/plugin marketplace add iefnaf/claude-code-moo
/plugin install claude-code-moo
```

That's it! 🎉 The cow moo sound will play automatically on the next permission prompt.

### Verify Installation

Check that the plugin is installed correctly:

```bash
# Check plugin is registered
cat ~/.claude/plugins/installed_plugins.json | grep claude-code-moo

# Verify hook configuration
cat ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/.claude-plugin/hooks.json
```

---

## 🔧 How It Works

This plugin leverages Claude Code's **PermissionRequest hook system**:

1. **Detection**: Hook detects when a permission prompt appears
2. **Trigger**: Executes the sound script with a 5-second timeout
3. **Playback**: Plays the cow moo sound using your system's audio player
4. **Fallback**: Silently falls back to terminal bell if audio fails

The hook uses an empty matcher (`""`) to catch **all permission requests**, ensuring you never miss an authorization prompt.

---

## 🛠️ Configuration

The plugin works out of the box with default settings. No configuration required!

### Customization (Coming Soon)

We're planning to add these features:

- 🔊 Volume control
- 🎵 Multiple sound options
- 🎚️ Enable/disable toggle
- ⏱️ Sound duration settings

---

## 🧪 Testing

### Test the Sound Directly

```bash
~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/scripts/play-cow-sound.sh
```

### Test with a Permission Prompt

1. Ask Claude Code to run a Bash command
2. You should hear the cow moo when the permission dialog appears

---

## 🐛 Troubleshooting

### Sound Not Playing?

**Step 1: Verify audio file exists**

```bash
ls -lh ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/assets/cow-moo.mp3
```

Expected output: `-rw-r--r-- ... 73K ... cow-moo.mp3`

**Step 2: Test the script directly**

```bash
~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/scripts/play-cow-sound.sh
```

**Step 3: Check script permissions**

```bash
ls -l ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/scripts/play-cow-sound.sh
# Should show: -rwxr-xr-x (executable)
```

If not executable, fix it:

```bash
chmod +x ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/scripts/play-cow-sound.sh
```

**Step 4: Verify your audio player**

- **macOS**: `which afplay` (built-in)
- **Linux**: `which paplay` (PulseAudio) or `which aplay` (ALSA)
- **Windows**: PowerShell is available by default

**Step 5: Check system volume**

Make sure your system audio is:
- Not muted
- Volume is at an audible level
- Correct output device is selected

### Sound Plays but Too Quiet?

**macOS**: The script uses `afplay -v 2.0` for boosted volume. If still too quiet:

```bash
# Increase volume multiplier (edit the script)
afplay -v 3.0 ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/assets/cow-moo.mp3
```

**Linux**: The script uses maximum PulseAudio volume. Check system volume settings:

```bash
pactl set-sink-volume @DEFAULT_SINK@ 100%
```

### Hook Not Triggering?

Check the hook configuration:

```bash
cat ~/.claude/plugins/cache/claude-code-moo/claude-code-moo/1.0.0/.claude-plugin/hooks.json
```

Should show:

```json
{
  "hooks": [
    {
      "event": "PermissionRequest",
      "matcher": "",
      "command": "bash -c 'CLAUDE_PLUGIN_ROOT=\"\\$(dirname \"\\$(dirname \"\\$(dirname \"\\$(readlink -f \"\\$0\"))\")\")\" && bash \"\\$CLAUDE_PLUGIN_ROOT/scripts/play-cow-sound.sh\"'",
      "timeout": 5000
    }
  ]
}
```

### Want to Disable Temporarily?

```bash
/plugin uninstall claude-code-moo
```

Reinstall anytime:

```bash
/plugin install claude-code-moo
```

---

## 📦 Requirements

- **Claude Code**: v1.0.80 or higher
- **Operating System**: macOS, Linux, or Windows
- **Audio**: Working system audio (built-in players included)

No additional dependencies required! The plugin uses your system's built-in audio player.

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📖 Improve documentation

### Development Setup

```bash
# Clone the repository
git clone https://github.com/iefnaf/claude-code-moo.git
cd claude-code-moo

# Test locally
claude plugin install --path .
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

- **Cow sound effect**: [Pixabay Sound Effects](https://pixabay.com/sound-effects/) (royalty-free)
- **Built with**: [Claude Code's Hook System](https://code.anthropic.com/docs/en/hooks)
- **Inspired by**: The need to never miss a permission prompt again

---

<div align="center">

Made with 🐄 by [iefnaf](https://github.com/iefnaf)

[⭐ Star this repo](https://github.com/iefnaf/claude-code-moo) · [🐧 Report issues](https://github.com/iefnaf/claude-code-moo/issues)

</div>
