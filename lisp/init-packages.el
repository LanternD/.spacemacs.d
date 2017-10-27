;; Add the package source

;; Initialization of packages
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
			    popwin
			    cnfonts
			    web-mode
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

;; ================

(global-company-mode t)

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

(require 'popwin)
(popwin-mode t)

;; open js file using js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; Deal with the Chinese fonts
(require 'cnfonts)
(cnfonts-enable)
(add-hook 'after-make-frame-functions 'cnfonts-set-font-with-saved-step)
(add-hook 'window-setup-hook 'cnfonts-set-font-with-saved-step)

(setq cnfonts-profiles
      '("program-profile" "org-profile" "reading-profile"))

(setq cnfonts--fontnames-fallback '(("Monaco" "Consolas" "DejaVu Sans Mono" "Droid Sans Mono" "Lucida Sans Typewriter" "Lucida Typewriter" "Fira Code")
				    ("文泉驿等宽微米黑" "微软雅黑" "Microsoft Yahei" "文泉驿等宽正黑" "黑体" "文泉驿正黑" "文泉驿点阵正黑" )
				    ("HanaMinB" "SimSun-ExtB" "MingLiU-ExtB" "PMingLiU-ExtB" "MingLiU_HKSCS-ExtB")))

(setq cnfonts--custom-set-fontnames cnfonts--fontnames-fallback)

(provide 'init-packages)
