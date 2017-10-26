;; text size
(text-scale-adjust +2)

;; turn off tool bar
(tool-bar-mode -1)

;; turn off scroll bar
(scroll-bar-mode -1)

;;(electric-indent-mode 1)
(setq inhibit-splash-screen t)

;; show line number
(global-linum-mode t)

;; Change cursor type from block to bar
(setq-default cursor-type 'bar)

;; load theme each time we start Emacs
(load-theme 'monokai t)

;; highlight current line
(global-hl-line-mode t)

;; start emacs with full screen
(setq initial-frame-alist '((width . 106) (height . 50)));(quote ((fullscreen . maximized))))

(provide 'init-ui)
