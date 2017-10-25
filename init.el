;;Starts everytime we enter Emacs.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Add the package source
(server-mode 1)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)
;; Add whatever packages you want here
(defvar lanternd/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    counsel
			    swiper
			    smartparens
			    js2-mode
			    ) "Default packages")
(setq package-selected-packages lanternd/packages)
(defun lanternd/packages-installed-p ()
  (loop for pkg in lanternd/packages
        when(not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (lanternd/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg lanternd/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg))))

;;=====================
;; turn off tool bar
(tool-bar-mode -1)
;; turn off scroll bar
(scroll-bar-mode -1)
;;(electric-indent-mode 1)
(setq inhibit-splash-screen t)
;; show line number
(global-linum-mode t)

(defun open-init-el()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2> q") 'open-init-el)

;; Key for finding variable, function and key, it is different from C-h v/f/k
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(global-company-mode t)
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

(require 'hungry-delete)
(global-hungry-delete-mode)

;; configuration for Smex
; (require 'smex)
; (smex-initialize)

;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-x") 'smex-major-mode-commands)
;; the old M-x key:
; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Configuration of ivy and swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; Configuration of Smartparens
(require 'smartparens-config)
; (add-hook 'js-mode-hook #'smartparens-mode)
;; (add-hook 'emacs-lisp-mode-hook #'smartparens-mode))
(smartparens-global-mode t)

(setq auto-mode-alist
  (append
    '(("\\.js\\'" . js2-mode))
      auto-mode-alist))



