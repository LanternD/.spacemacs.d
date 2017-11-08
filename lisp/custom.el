;; Customized group configurations

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.4)
 '(custom-safe-themes
   (quote
    ("8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options nil)
 '(ergoemacs-use-menus t)
 '(initial-scratch-message
   ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with \\[find-file] and enter text in its buffer.

")
 '(ivy-truncate-lines nil)
 '(monokai-highlight "#90ee90")
 '(org-descriptive-links t)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("#" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t)))))
 '(org-export-backends (quote (ascii html latex md gfm)))
 '(org-md-headline-style (quote atx))
 '(org-replace-disputed-keys nil)
 '(org-special-ctrl-a/e nil)
 '(org-support-shift-select nil)
 '(package-selected-packages
   (quote
    (use-package which-key auto-yasnippet flycheck ergoemacs-mode org-pomodoro org ox-gfm iedit expand-region js2-refactor nodejs-repl js2-mode smartparens company monokai-theme hungry-delete counsel swiper)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80)
 '(recentf-menu-before "Open File...")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gainsboro")))))

(provide 'custom)
