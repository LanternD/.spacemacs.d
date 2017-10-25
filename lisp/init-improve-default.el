;; disable the sound when we scroll to top or bottom. 
(setq ring-bell-function 'ignore)

;; auto revert mode
(global-auto-revert-mode t)

;; abbrevation table
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8ld" "LanternD")
					    ))

;; delete selections
(delete-selection-mode t)

;; Do not generte backup, do not save backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Configuration of recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; show matched parenthensis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-improve-default)
