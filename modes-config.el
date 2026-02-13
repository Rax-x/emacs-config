;;; modes-config.el --- Programming Modes and Editor Behavior Configuration

;; -----------------------------------------------------------------------
;; Company
;; -----------------------------------------------------------------------

(use-package company
  :ensure t
  :defer t
  :custom
  ;; Settings to make completion feel more responsive
  (company-minimum-prefix-length 1)     ; Start completing after 1 character
  (company-idle-delay 0.0)              ; Show suggestions immediately
  (company-tooltip-align-annotations t) ; Align hints (like types) to the right
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
  :hook (after-init . delete-selection-mode))

(provide 'modes-config)
