;;; Helm - Emacs incremental completion and selection narrowing framework
;;; http://tuhdo.github.io/helm-intro.html


(use-package helm)
(use-package helm-ag)
(use-package helm-ls-git)
(use-package helm-gtags)
(use-package helm-mt)
(use-package helm-swoop)


(require 'helm)
(require 'helm-config)
(require 'helm-ag)
(require 'helm-ls-git)
(require 'helm-mt)
(require 'helm-swoop)



;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))


;; helm-M-x
(global-set-key (kbd "M-X") 'helm-M-x)
(global-set-key (kbd "C-c h x") 'helm-M-x)
;; Ido fuzzy match is better than helm-M-x-fuzzy-match
;; (setq helm-M-x-fuzzy-match t)

;; helm-semantic-or-imenu
;; "<helm-command-prefix> i"
;; C-c h i
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match    t)

;; helm-man-woman - lookup man pages
;; "<helm-command-prefix> m"
;; C-c h m
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; helm-occur - enhanced occur
(global-set-key (kbd "C-c h o") 'helm-occur)


;;; helm-ag
(setq helm-ag-use-grep-ignore-list t)
(setq helm-ag-insert-at-point 'symbol)
(global-set-key (kbd "C-c h g") 'helm-do-ag)


;;; Other useful commands

;; helm-regexp - build regexps
;; alternative to regexp-builder
;; "<helm-command-prefix> r"
;; C-c h r

;; helm-find - run "find" command
;; "<helm-command-prefix> /"
;; C-c h /

;; helm-color
;; Quickly view and copy hexadecimal values of colors
;; "<helm-command-prefix> c"
;; C-c h c

;; helm-apropos
;; All in one command for describe commands, functions, variables and faces
;; "<helm-command-prefix> a"
;; C-c h a
(setq helm-apropos-fuzzy-match t)

;; helm-mini
;; Ido is better than helm-mini
;;
;; Original "C-x C-b" is "list-buffers"
(global-set-key (kbd "C-x C-b") 'helm-mini)
;; Original "C-c h b" is "helm-resume"
(global-set-key (kbd "C-c h b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

;; helm-find-files
;; Ido is better than helm-find-files
;; 
;; While running "helm-find-files",
;; hit "C-s" to search in highlighted entry.
;; hit "C-u C-s" to search recursively.
;;
;; Original "C-c h f" is "helm-multi-files"
(global-set-key (kbd "C-c h f") 'helm-find-files)


(provide 'init-helm)
