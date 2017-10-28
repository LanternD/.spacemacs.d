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
 '(ivy-truncate-lines nil)
 '(monokai-highlight "#90ee90")
 '(org-export-backends (quote (ascii html latex md gfm)))
 '(org-md-headline-style (quote setext))
 '(package-selected-packages
   (quote
    (org ox-gfm iedit expand-region js2-refactor nodejs-repl js2-mode smartparens company monokai-theme hungry-delete counsel swiper)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gainsboro")))))

(provide 'custom)
