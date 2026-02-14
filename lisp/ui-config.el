;;; ui-config.el --- Visual and Global Editor Behavior

;; -----------------------------------------------------------------------
;; Editor Utilities
;; -----------------------------------------------------------------------

(defun set-custom-tab-size (tab-size)
  "Set a global indentation style with a specific TAB-SIZE.
Disables electric indent, enforces spaces over tabs, and aligns 
C-style languages to the same width."
  (setq-default indent-tabs-mode nil)    ; Use spaces, not tabs
  (setq-default tab-width tab-size)      ; Visual width of a tab character
  (setq-default c-basic-offset tab-size) ; Indent width for C/C++/Java
  (electric-indent-mode 0))

;; -----------------------------------------------------------------------
;; UI De-Clutter (Minimalist Interface)
;; -----------------------------------------------------------------------

(setq inhibit-startup-screen t)    ; Don't show the "About Emacs" screen
(menu-bar-mode -1)                 ; Hide the top menu bar
(tool-bar-mode -1)                 ; Hide the icon toolbar
(scroll-bar-mode -1)               ; Hide the side scroll bar
(global-display-line-numbers-mode) ; Show line numbers in all buffers
(column-number-mode t)             ; Show column number in the mode line
(display-battery-mode t)           ; Useful when I'm using a the laptop

;; -----------------------------------------------------------------------
;; Editor Behavior
;; -----------------------------------------------------------------------

(setq make-backup-files nil)      ; Stop creating 'file~' backup files
(ido-mode t)                      ; Interactive Do: better minibuffer completion
(setq ido-enable-flex-matching t) ; Make IDO search fuzzy

;; -----------------------------------------------------------------------
;; Aesthetics & Theming
;; -----------------------------------------------------------------------

;; Font Height: 130 is roughly 13pt
(set-face-attribute 'default nil :height 130)

(set-custom-tab-size 4)

(load-theme 'doom-vibrant t)

(provide 'ui-config)
