;;Starts everytime we enter Emacs.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-init-el()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(server-mode 1)

(require 'init-packages)
(require 'init-ui)
(require 'init-improve-default)
(require 'init-org)
(require 'init-keybinding)
(require 'custom)

;; Put all the customized package settings to custom.el file.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
