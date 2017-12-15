(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    ((#("latexmk" 0 1
        (idx 1))
      "latexmk -pdf %s" TeX-run-TeX nil t :help "Run latexmk on file")
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     (#("LaTeX" 0 1
        (idx 2))
      "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     (#("BibTeX" 0 1
        (idx 3))
      "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     (#("Biber" 0 1
        (idx 4))
      "biber %s" TeX-run-Biber nil t :help "Run Biber")
     (#("View" 0 1
        (idx 5))
      "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     (#("Print" 0 1
        (idx 6))
      "%p" TeX-run-command t t :help "Print the file")
     (#("Queue" 0 1
        (idx 7))
      "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     (#("File" 0 1
        (idx 8))
      "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     (#("Dvips" 0 1
        (idx 9))
      "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     (#("Dvipdfmx" 0 1
        (idx 10))
      "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     (#("Ps2pdf" 0 1
        (idx 11))
      "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     (#("Glossaries" 0 1
        (idx 12))
      "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     (#("Index" 0 1
        (idx 13))
      "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     (#("upMendex" 0 1
        (idx 14))
      "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     (#("Xindy" 0 1
        (idx 15))
      "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     (#("Check" 0 1
        (idx 16))
      "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     (#("ChkTeX" 0 1
        (idx 17))
      "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     (#("Spell" 0 1
        (idx 18))
      "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     (#("Clean" 0 1
        (idx 19))
      "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     (#("Clean All" 0 1
        (idx 20))
      "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     (#("Other" 0 1
        (idx 21))
      "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-save-query nil)
 '(TeX-source-correlate-method (quote ((dvi . synctex) (pdf . synctex))))
 '(TeX-source-correlate-start-server t t)
 '(TeX-view-program-list
   (quote
    (("Sumatra PDF"
      ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
       (mode-io-correlate " -forward-search %b %n")
       " %o")
      nil))))
 '(TeX-view-program-selection (quote ((output-pdf "Sumatra PDF"))))
 '(company-minimum-prefix-length 3)
 '(delete-selection-mode t)
 '(ispell-personal-dictionary "~/.aspell_pws/.aspell.en.pws")
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (3 ((shift) . 5) ((control)))))
 '(org-export-backends (quote (ascii html latex md)))
 '(org-export-with-sub-superscripts (quote {}))
 '(org-highlight-latex-and-related (quote (latex)))
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (ghub let-alist all-the-icons memoize font-lock+ yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode company-anaconda anaconda-mode pythonic auctex-latexmk company-auctex auctex ox-gfm smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor flyspell-correct-ivy flyspell-correct auto-dictionary org-projectile org-pomodoro alert log4e markdown-toc flycheck-pos-tip pos-tip company-statistics auto-yasnippet ac-ispell unfill org-category-capture org-present gntp org-download mwim mmm-mode markdown-mode htmlize gnuplot gh-md fuzzy flycheck company yasnippet auto-complete ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent adaptive-wrap ace-window ace-link avy org-plus-contrib evil-unimpaired f s dash))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-dir-link-face ((t (:inherit bold :foreground "#4f97d7" :height 0.9))))
 '(neo-file-link-face ((t (:foreground "#b2b2b2" :height 0.9))))
 '(neo-root-dir-face ((t (:inherit bold :foreground "#bc6ec5" :height 0.9)))))
