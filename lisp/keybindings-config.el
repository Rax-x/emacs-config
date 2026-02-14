;;; keybindings-config.el --- Personal Keybindings and Editing Utilities

;; -----------------------------------------------------------------------
;; Line Manipulation
;; -----------------------------------------------------------------------

(defun mark-line ()
  "Select the current line from beginning to end and activate the region."
  (interactive)
  (beginning-of-line)
  (set-mark (point))
  (end-of-line))

(defun move-line-up ()
  "Swap the current line with the line above it and move the cursor up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  "Swap the current line with the line below it and move the cursor down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; -----------------------------------------------------------------------
;; Web & Browser Integration
;; -----------------------------------------------------------------------

(defun open-url-in-browser (start end)
  "Open the selected text between START and END in the default browser.
If the selection lacks a protocol (e.g., 'google.com'), it prepends 'https://'."
  (interactive "r")
  (let* ((selection (buffer-substring-no-properties start end))
         ;; Clean up whitespace and newlines
         (url (string-trim selection)))
    (if (string-empty-p url)
        (user-error "No text selected!")
      ;; Basic URL validation/fix
      (unless (string-match-p "^\\(http\\|https\\|file\\|ftp\\):" url)
        (setq url (concat "https://" url)))
      (message "Opening: %s" url)
      (browse-url url))))

;; -----------------------------------------------------------------------
;; Global Keybindings
;; -----------------------------------------------------------------------

;; Window Navigation
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)
(global-set-key (kbd "C-M-<left>") 'windmove-left)
(global-set-key (kbd "C-M-<right>") 'windmove-right)

;; Line Editing
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "C-l") 'mark-line)

;; Utilities
(global-set-key (kbd "<f5>") 'open-url-in-browser)

(provide 'keybindings-config)
