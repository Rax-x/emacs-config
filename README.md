# 🧠 My Emacs Configuration

A modern, fast, and minimal configuration for **GNU Emacs** focused on productivity, development, and clean defaults.

## 📂 Structure

```
~/.emacs.d/
│
├── init.el
└── lisp/
    ├── packages-config.el
    ├── ui-config.el
    ├── modes-config.el
    ├── keybindings-config.el
    ├── lsp-config.el
    └── custom.el
└── README.md
```

**File Overview**

- **init.el**: Entry point. Loads all configuration modules.
- **packages-config.el**: Package management and package declarations.
- **ui-config.el**: UI tweaks (theme, modeline, fonts, startup behavior).
- **modes-config.el**: Programming modes and major-mode configuration.
- **keybindings-config.el**: Custom global and mode-specific keybindings.
- **lsp-config.el**: LSP setup and language server integration.
- **custom.el**: Automatically generated settings by Emacs Customize system.

## 🚀 Installation

```bash
git clone https://github.com/Rax-x/emacs-config.git ~/.emacs.d
```
