;; enable syntax-highlight in org mode
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("D:/Dropbox/AGDA"))

;; visual line mode in org-mode
(add-hook 'org-mode-hook #'(lambda ()
			     (visual-line-mode)
			     (setq word-wrap nil)))
(setq org-startup-truncated nil)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "D:/Dropbox/AGDA/Orz.org" "Agenda")
	 "* TODO [#B] %?\n %i\n"
	 :empty-line 1)))

(eval-after-load "emacs-lisp" '(define-key (kbd "<RET>") '((electric-newline-and-maybe-indent))))

(provide 'init-org)
