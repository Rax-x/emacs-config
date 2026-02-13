;;; lsp-config.el --- Language Server Protocol (Eglot) and Mode Mappings

;; -----------------------------------------------------------------------
;; Eglot Setup
;; -----------------------------------------------------------------------

(use-package eglot
  :ensure nil
  ;; Disable annoying "format while typing" features that can cause lag
  :custom (eglot-ignored-server-capabilities 
           '(:documentOnTypeFormattingProvider)))

;; Auto-start Eglot for specific languages
(let ((lsp-modes '(haskell-mode
                   c-mode
                   c++-mode
                   rust-mode
                   python-mode
                   javascript-mode
                   typescript-ts-mode)))
  (dolist (mode lsp-modes)
    (add-hook (intern (concat (symbol-name mode) "-hook")) #'eglot-ensure)))

;; -----------------------------------------------------------------------
;; File Type Mappings (Tree-sitter)
;; -----------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(provide 'lsp-config)

