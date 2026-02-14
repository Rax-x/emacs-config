;;; packages-config.el --- MELPA and Automated Package Installation

;; -----------------------------------------------------------------------
;; Package Manager Initialization
;; -----------------------------------------------------------------------

(require 'package)

;; Add MELPA to the list of repositories if it's not already there
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; -----------------------------------------------------------------------
;; Installation Logic
;; -----------------------------------------------------------------------

(defun ensure-package-installed (packages)
  "Check for the installation of PACKAGES; install them automatically if missing.
Refreshes the package index only once if any package is missing."
  (let ((missing-packages 
         (cl-remove-if #'package-installed-p packages)))
    (when missing-packages
      (message "Refreshing package contents...")
      (package-refresh-contents)
      (dolist (pkg missing-packages)
        (message "Installing package: %s" pkg)
        (package-install pkg)))))

;; -----------------------------------------------------------------------
;; Essential Bootstrapping
;; -----------------------------------------------------------------------

;; 'use-package' is built-in as of Emacs 29. 
;; For older versions, we ensure it's installed first.
(when (< emacs-major-version 29)
  (ensure-package-installed '(use-package)))

;; -----------------------------------------------------------------------
;; My Packages
;; -----------------------------------------------------------------------

(setq my-package-list
      '(rust-mode
        magit
        spacemacs-theme
        zenburn-theme 
        company 
        doom-themes 
        markdown-mode))

(ensure-package-installed my-package-list)

(provide 'packages-config)
