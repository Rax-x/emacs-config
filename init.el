;;;  -*- lexical-binding: t; -*-
;;; init.el --- User Configuration Entry Point

;; Garbage Collector Tuning
(setq gc-cons-threshold (* 100 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 32 1024 1024))))

;; Enable Native Compilation
(if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (progn
      (setq native-comp-async-report-warnings-errors 'silent)
      (setq comp-deferred-compilation t)))

;; Midnight Mode
(setq clean-buffer-list-delay-general 0.08)

(use-package midnight
  :ensure nil
  :config

  (setq midnight-period 3600)
  (midnight-mode 1))

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

