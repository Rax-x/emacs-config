;; -*- lexical-binding: t; -*-
;;; modes-config.el --- Programming Modes and Editor Behavior Configuration

;; EditorConfig
(editorconfig-mode 1)

;; Company
(use-package company
  :ensure t
  :defer t

  :hook 
  (after-init . global-company-mode)

  :bind
  ;; Helpful shortcuts when the completion menu is open
  (:map company-active-map
        ("<tab>" . company-complete-selection)
        ("C-n"   . company-select-next)
        ("C-p"   . company-select-previous)))

;; -----------------------------------------------------------------------
;; Delsel (Delete Selection Mode)
;; -----------------------------------------------------------------------

(use-package delsel
  :ensure nil ; Built-in to Emacs
  :defer t
  :hook (after-init . delete-selection-mode))

(provide 'modes-config)
