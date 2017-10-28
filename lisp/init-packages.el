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
			    js2-refactor
			    expand-region
			    iedit
			    ox-gfm
			    markdown-mode
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
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

;; Configuration for web-mode
;; set the indent to 2.
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; html
  (setq web-mode-css-indent-offset 2) ; css
  (setq web-mode-code-indent-offset 2)) ; js

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;; toggle between 2 indent and 4 indent
(defun my-toggle-web-indent ()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; Configuration to the js2refector package
(add-hook 'js2-mode-hook #'js2-refector-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; Add more regular expression to update the imenu function
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
  ;; (setq imenu-generic-expression 'nil(("describe\\(\"\\(.+\\)\" \\)")))
  (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			     ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			     ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			     ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			     ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			     ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			     ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			     ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			     ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))

(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))

;; About expand-region package
(require 'expand-region)

;; Load GFM exporter after loading the major mode
;; (require 'ox-gfm)
(eval-after-load "org"
  '(require 'ox-gfm nil t))

(provide 'init-packages)
