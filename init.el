;;Starts everytime we enter Emacs.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(add-to-list 'load-path "~/.emacs.d/lisp/")
(server-mode 1)
(text-scale-adjust +2)
(require 'init-packages)

;;=====================
;; turn off tool bar
(tool-bar-mode -1)
;; turn off scroll bar
(scroll-bar-mode -1)
;;(electric-indent-mode 1)
(setq inhibit-splash-screen t)
;; show line number
(global-linum-mode t)
;; auto revert mode
(global-auto-revert-mode t)

;; disable the sound when we scroll to top or bottom. 
(setq ring-bell-function 'ignore)

(defun open-init-el()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2> q") 'open-init-el)

;; Key for finding variable, function and key, it is different from C-h v/f/k
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq-default cursor-type 'bar)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.4)
 '(custom-safe-themes
   (quote
    ("8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(package-selected-packages
   (quote
    (nodejs-repl js2-mode smartparens company monokai-theme hungry-delete counsel swiper))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gainsboro")))))
		      
;; enable syntax highlight in comments
(setq make-backup-files nil)
(setq auto-save-default nil)
(require 'org)
(setq org-src-fontify-natively t)

;; set recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; delete selections
(delete-selection-mode t)

;; start emacs with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; show matched parenthensis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; highlight current line
(global-hl-line-mode t)

;; load theme each time we start Emacs
(load-theme 'monokai t)



(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8ld" "LanternD")
					    ))
