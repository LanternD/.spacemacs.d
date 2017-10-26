;; disable the sound when we scroll to top or bottom. 
(setq ring-bell-function 'ignore)

;; auto revert mode
(global-auto-revert-mode t)

;; abbrevation table
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8ld" "LanternD")
					    ))

;; customized indent function
(defun indent-whole-buffer()
  (interactive)
  (indent-region (point-min) (point-max))
  )

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion 
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  ;;(message "Selected region is indented.")
	  )
      (progn 
	(indent-whole-buffer)
	;;(message "The whole buffer is indented.")
	)
      )
    )
  )

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

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
