;;; init-plugin.el --- common plugins
;;; Commentary:
;;; Code:

;;; Theme
;(use-package color-theme-sanityinc-tomorrow)
;(require 'color-theme-sanityinc-tomorrow)
;(load-theme 'sanityinc-tomorrow-night t)
(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  )


;;; Anzu
(use-package anzu
  :config
  (global-anzu-mode t)
  )


;;; company-mode - Modular in-buffer completion framework
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;; (setq company-dabbrev-downcase nil)
  ;;; remove annoying blinking
  ;;(setq company-echo-delay 0)
  )


;;; complete c/c++ headers
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers)
  )


;;; Highlight Indentation
(use-package highlight-indentation
  :init
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'xml-mode-hook 'highlight-indentation-mode)
  (add-hook 'nxml-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  )

;;; Uniquify - Making buffer names unique
(setq uniquify-buffer-name-style 'post-forward)



;;; Flycheck - Modern on the fly syntax checking
;; Quick start : http://www.flycheck.org/manual/latest/Quickstart.html
;; Install ShellCheck https://github.com/koalaman/shellcheck/releases
(use-package flycheck
  :config
  (global-flycheck-mode)
  )


;;; Markdown mode
(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" markdown-mode-syntax-table)))
  )

;;; adoc-mode
(use-package adoc-mode
  :mode "\\.adoc\\'"
  :config
  (add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))
  )

;;; lua-mode
(use-package lua-mode
  :mode "\\.lua\\'"
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (add-hook 'lua-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" lua-mode-syntax-table)))
  (setq lua-indent-level 4)
  )

;;; cmake-mode
(use-package cmake-mode)

;;; rainbow-delimiters
(use-package rainbow-delimiters
  :init
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  )

;;; avy-mode
(use-package avy)

;;; window-numbering
(use-package window-numbering
  :config
  (window-numbering-mode t)
  )

;;; lemon-mode
(use-package lemon-mode)

;;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs
      (list (expand-file-name "snippets/snippets" user-emacs-directory))))
(yas-global-mode 1)


;;; expand-region
(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


;;; clang-format
(use-package clang-format
  :config
  (setq-default clang-format-style "{IndentWidth: 4}"))


;;; yaml-mode
(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (lambda () (modify-syntax-entry ?_ "w" yaml-mode-syntax-table))
  )


;;; fic-mode
(use-package fic-mode)


;;; dockerfile-mode
(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;;; counsel swiper and ivy
(use-package swiper)
(use-package counsel)
;; (ivy-mode t)


(use-package exec-path-from-shell
  :config
  ;; exec-path-from-shell
  (if (not (string-equal system-type "windows-nt"))
      (progn
        (exec-path-from-shell-initialize)
        (exec-path-from-shell-copy-env "GOPATH")
        )
    ))


;;; nginx-mode
(use-package nginx-mode)


;;; plantuml-mode
;; (use-package plantuml-mode)
(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))


;;; projectile
(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  )

;;; racket-mode
; too slow
;(use-package racket-mode)

(use-package scheme-mode
  :mode "\\.rkt\\'"
  )

(provide 'init-plugin)
;;; init-plugin.el ends here
