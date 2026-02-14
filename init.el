;;; init.el --- User Configuration Entry Point  -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'packages-config) 

(require 'use-package)
(setq use-package-always-ensure t)

(require 'ui-config)
(require 'modes-config)
(require 'keybindings-config)
(require 'lsp-config)

;; Move auto-generated UI/customization code to its own file 
;; to keep this init.el clean and predictable.
(setq custom-file (locate-user-emacs-file "lisp/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
