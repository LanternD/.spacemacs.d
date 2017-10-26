

;; Open my init file
(global-set-key (kbd "<f2> q") 'open-init-el)

;; Key for finding variable, function and key, it is different from C-h v/f/k
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; Key to open recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Key to open Agenda in Org mode 
(global-set-key (kbd "C-c a") 'org-agenda)

;; Key to open counsel-git, c for counsel, g for git
(global-set-key (kbd "C-c c g") 'counsel-git)

;; Key to deal with the indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Shift the M-/ key from dabbrev-expand to hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'init-keybinding)
