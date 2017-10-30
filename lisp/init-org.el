;; enable syntax-highlight in org mode
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("Dropbox/AGDA"))

;; visual line mode in org-mode
(add-hook 'org-mode-hook #'(lambda ()
			    (visual-line-mode)
			    (setq word-wrap nil)))
(setq org-startup-truncated nil)

(provide 'init-org)
