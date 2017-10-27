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


;; set the list for hippie-expand
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-list-symbol))

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

;; shorten the yes or no request
(fset 'yes-or-no-p 'y-or-n-p)

;; enable always do recursive execution when copy or delete
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; Limit the dired buffer to only one. (enabled when open a dir by return key)
(put 'dired-find-alternate-file 'disabled nil)

;; open the folder of current file by C-x C-j
(require 'dired-x)
(setq dired-dwim-target t)

;; Highlight the enclosing parenthensis while the cursor is inside it.
(define-advice show-paren-function (:around (fn) fix-show-paren-functioon)
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; Hide the ^M in the DOS files
(defun hidden-dos-eol()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Option 2: remove ^M
(defun remove-dos-eol()
  (interactive)
  (goto-char (point-min))
  (while (serach-forward "\r" nil t) (replace-match "")))

;; Improvement to the occur mode, change the default value to the word that the cursor pointing to.
;; dwim = do what I mean \approx customization.
(defun occur-dwim ()
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; Org mode export without TOC

(setq org-export-with-toc nil)

(provide 'init-improve-default)
